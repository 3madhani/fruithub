import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruithub/core/errors/exception.dart';
import 'package:fruithub/core/errors/failure.dart';
import 'package:fruithub/core/services/database_services.dart';
import 'package:fruithub/core/utils/backend_endpoints.dart';
import 'package:fruithub/feature/auth/data/models/user_model.dart';
import 'package:fruithub/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices databaseServices;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseServices,
  });
  @override
  Future addUserData({required UserEntity userEntity}) async {
    await databaseServices.setData(
      path: BackendEndpoints.addUserData,
      data: userEntity.toMap(),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(uId: user.uid, name: name, email: email);
      await addUserData(userEntity: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log("Error in createUserWithEmailAndPassword: ${e.toString()}");
      return left(const ServerFailure('حدث خطا غير متوقع يرجى المحاولة لاحقا'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(userEntity: userEntity);
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      await deleteUser(user);
      log("Error in signInWithApple: ${e.toString()}");
      return left(const ServerFailure('حدث خطا غير متوقع يرجى المحاولة لاحقا'));
    }
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
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(userEntity: userEntity);
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log("Error in signInWithFacebook: ${e.toString()}");
      return left(const ServerFailure('حدث خطا غير متوقع يرجى المحاولة لاحقا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(userEntity: userEntity);
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
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
}
