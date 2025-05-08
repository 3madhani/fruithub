import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruithub/core/errors/exception.dart';

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
}
