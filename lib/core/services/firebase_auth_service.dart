import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruithub/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
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
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
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
