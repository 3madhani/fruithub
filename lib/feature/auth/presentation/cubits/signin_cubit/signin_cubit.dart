import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SiginState> {
  final AuthRepo authRepo;
  SigninCubit(this.authRepo) : super(const SiginState());

  // Clear all errors
  void clearErrors() {
    emit(
      state.copyWith(
        emailError: null,
        facebookError: null,
        googleError: null,
        appleError: null,
      ),
    );
  }

  // Reset to initial state
  void reset() {
    emit(const SiginState());
  }

  Future<void> signInWithApple() async {
    // Prevent duplicate requests
    if (state.isLoadingApple) return;

    emit(state.copyWith(isLoadingApple: true, appleError: null));
    final result = await authRepo.signInWithApple();
    result.fold(
      (failure) => emit(
        state.copyWith(isLoadingApple: false, appleError: failure.message),
      ),
      (userEntity) => emit(
        state.copyWith(
          isLoadingApple: false,
          appleError: null,
          userEntity: userEntity,
        ),
      ),
    );
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // Prevent duplicate requests
    if (state.isLoadingEmail) return;

    emit(state.copyWith(isLoadingEmail: true, emailError: null));
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(isLoadingEmail: false, emailError: failure.message),
      ),
      (userEntity) => emit(
        state.copyWith(
          isLoadingEmail: false,
          emailError: null,
          userEntity: userEntity,
        ),
      ),
    );
  }

  Future<void> signInWithFacebook() async {
    // Prevent duplicate requests
    if (state.isLoadingFacebook) return;

    emit(state.copyWith(isLoadingFacebook: true, facebookError: null));
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingFacebook: false,
          facebookError: failure.message,
        ),
      ),
      (userEntity) => emit(
        state.copyWith(
          isLoadingFacebook: false,
          facebookError: null,
          userEntity: userEntity,
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    // Prevent duplicate requests
    if (state.isLoadingGoogle) return;

    emit(state.copyWith(isLoadingGoogle: true, googleError: null));
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(
        state.copyWith(isLoadingGoogle: false, googleError: failure.message),
      ),
      (userEntity) => emit(
        state.copyWith(
          isLoadingGoogle: false,
          googleError: null,
          userEntity: userEntity,
        ),
      ),
    );
  }
}
