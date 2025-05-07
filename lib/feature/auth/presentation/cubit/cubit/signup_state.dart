part of 'signup_cubit.dart';

final class SignupFailure extends SignupState {
  final String error;

  SignupFailure({required this.error});
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

@immutable
sealed class SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}
