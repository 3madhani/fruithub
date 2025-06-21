import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_info_entity.dart';

class UserInfoError extends UserInfoState {
  final String message;

  const UserInfoError(this.message);

  @override
  List<Object?> get props => [message];
}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final UserInfoEntity user;

  const UserInfoLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserInfoLoading extends UserInfoState {}

abstract class UserInfoState extends Equatable {
  const UserInfoState();
  @override
  List<Object?> get props => [];
}

