part of 'update_info_cubit.dart';

final class UpdateInfoInitial extends UpdateInfoState {}

sealed class UpdateInfoState extends Equatable {
  const UpdateInfoState();

  @override
  List<Object> get props => [];
}

final class UpdateUserInfoFailedState extends UpdateInfoState {
  final String message;
  const UpdateUserInfoFailedState(this.message);
}

final class UpdateUserInfoLoadingState extends UpdateInfoState {}

final class UpdateUserInfoSuccessState extends UpdateInfoState {
  final String message;
  const UpdateUserInfoSuccessState(this.message);
}

final class UploadImageFailedState extends UpdateInfoState {
  final String message;
  const UploadImageFailedState(this.message);
}

final class UploadImageLoadingState extends UpdateInfoState {}

final class UploadImageSuccessState extends UpdateInfoState {
  final String message;
  const UploadImageSuccessState(this.message);
}
