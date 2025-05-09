part of 'signin_cubit.dart';

@immutable
sealed class SiginState {}

final class SigninInitial extends SiginState {}

final class SigninLoading extends SiginState {}
final class SigninFailure extends SiginState {
  final String error;

  SigninFailure({required this.error});
}
final class SigninSuccess extends SiginState {
  final UserEntity userEntity;

  SigninSuccess({required this.userEntity});
}
