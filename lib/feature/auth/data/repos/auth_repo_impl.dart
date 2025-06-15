import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/app_const.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

// imports as before...

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
      data: UserModel.fromEntity(userEntity).toJson(),
      documentId: userEntity.uId,
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
  Future<UserEntity> getUserData({required String uId}) async {
    var data = await databaseServices.getData(
      path: BackendEndpoints.getUserData,
      documentId: uId,
    );
    return UserModel.fromJson(data);
  }

  @override
  Future saveUserData({required UserEntity userEntity}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(userEntity).toJson());
    await Prefs.setString(AppConst.userData, jsonData);
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

      var isUserExist = await databaseServices.checkIfDocumentExists(
        path: BackendEndpoints.getUserData,
        documentId: user.uid,
      );

      UserEntity userEntity;
      if (isUserExist) {
        userEntity = await getUserData(uId: user.uid);
      } else {
        userEntity = UserModel.fromFirebaseUser(user);
        await addUserData(userEntity: userEntity);
      }

      await saveUserData(userEntity: userEntity);
      return Right(userEntity);
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

      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(userEntity: userEntity);
      return Right(userEntity);
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

      var isUserExist = await databaseServices.checkIfDocumentExists(
        path: BackendEndpoints.getUserData,
        documentId: user.uid,
      );

      UserEntity userEntity;
      if (isUserExist) {
        userEntity = await getUserData(uId: user.uid);
      } else {
        userEntity = UserModel.fromFirebaseUser(user);
        await addUserData(userEntity: userEntity);
      }

      await saveUserData(userEntity: userEntity);
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

      var isUserExist = await databaseServices.checkIfDocumentExists(
        path: BackendEndpoints.getUserData,
        documentId: user.uid,
      );

      UserEntity userEntity;
      if (isUserExist) {
        userEntity = await getUserData(uId: user.uid);
      } else {
        userEntity = UserModel.fromFirebaseUser(user);
        await addUserData(userEntity: userEntity);
      }

      await saveUserData(userEntity: userEntity);
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
