import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruithub/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "FirebaseAuthService.createUserWithEmailAndPassword CustomException: ${e.toString()} code: ${e.code}",
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جدا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message:
              'البريد الالكتروني مستخدم مسبقا. يرجى تسجيل الدخول او استخدام بريد اخر',
        );
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الالكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من اتصالك بالانترنت.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(message: 'حدث خطا غير متوقع يرجى المحاولة لاحقا');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
          message: 'لقد قمت بعمليات تسجيل دخول كثيرة في فترة قصيرة.',
        );
      } else {
        throw CustomException(message: 'حدث خطا غير متوقع يرجى المحاولة لاحقا');
      }
    } catch (e) {
      log(
        "FirebaseAuthService.createUserWithEmailAndPassword CustomException: ${e.toString()}",
      );
      throw CustomException(message: 'حدث خطا غير متوقع يرجى المحاولة لاحقا');
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider(
      "apple.com",
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(
      oauthCredential,
    )).user!;
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "FirebaseAuthService.signInWithEmailAndPassword CustomException: ${e.toString()} code: ${e.code}",
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'البريد الالكتروني غير موجود.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
          message: "البريد الالكتروني او كلمة المرور غير صحيحة.",
        );
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الالكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من اتصالك بالانترنت.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(message: 'حدث خطا غير متوقع يرجى المحاولة لاحقا');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
          message: 'لقد قمت بعمليات تسجيل دخول كثيرة في فترة قصيرة.',
        );
      } else {
        throw CustomException(message: 'حدث خطا غير متوقع يرجى المحاولة لاحقا');
      }
    } catch (e) {
      log(
        "FirebaseAuthService.signInWithEmailAndPassword CustomException: ${e.toString()}",
      );
      throw CustomException(message: 'حدث خطا غير متوقع يرجى المحاولة لاحقا');
    }
  }

  Future<User> signInWithFacebook() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final LoginResult loginResult = await FacebookAuth.instance.login(
      nonce: nonce,
    );

    OAuthCredential facebookAuthCredential;

    if (Platform.isIOS) {
      switch (loginResult.accessToken!.type) {
        case AccessTokenType.classic:
          final token = loginResult.accessToken as ClassicToken;
          facebookAuthCredential = FacebookAuthProvider.credential(
            token.authenticationToken!,
          );
          break;
        case AccessTokenType.limited:
          final token = loginResult.accessToken as LimitedToken;
          facebookAuthCredential = OAuthCredential(
            providerId: 'facebook.com',
            signInMethod: 'oauth',
            idToken: token.tokenString,
            rawNonce: rawNonce,
          );
          break;
      }
    } else {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
    }
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
