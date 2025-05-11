import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruithub/core/errors/exception.dart';
import 'package:fruithub/core/errors/failure.dart';
import 'package:fruithub/feature/auth/data/models/user_model.dart';
import 'package:fruithub/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log("Error in createUserWithEmailAndPassword: ${e.toString()}");
      return left(const ServerFailure('حدث خطا غير متوقع يرجى المحاولة لاحقا'));
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log("Error in signInWithEmailAndPassword: ${e.toString()}");
      return left(const ServerFailure('حدث خطا غير متوقع يرجى المحاولة لاحقا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook()async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Error in signInWithFacebook: ${e.toString()}");
      return left(const ServerFailure('حدث خطا غير متوقع يرجى المحاولة لاحقا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Error in signInWithGoogle: ${e.toString()}");
      return left(const ServerFailure('حدث خطا غير متوقع يرجى المحاولة لاحقا'));
    }
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
  
  @override
  Future<void> verifyEmail() {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      var user = await firebaseAuthService.signInWithApple();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Error in signInWithApple: ${e.toString()}");
      return left(const ServerFailure('حدث خطا غير متوقع يرجى المحاولة لاحقا'));
    }
    
  }
}
