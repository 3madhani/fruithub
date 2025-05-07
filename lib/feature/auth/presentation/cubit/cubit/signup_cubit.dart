import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/feature/auth/domain/repos/auth_repo.dart';

import '../../../domain/entities/user_entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignupFailure(error: failure.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}
