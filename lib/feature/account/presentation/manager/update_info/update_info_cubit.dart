import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/repos/images_repo/images_repo.dart';
import '../../../domain/repos/user_info_repo.dart';

part 'update_info_state.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoState> {
  final ImagesRepo? imagesRepo;
  final UserInfoRepo userInfoRepo;
  UpdateInfoCubit(this.imagesRepo, this.userInfoRepo)
    : super(UpdateInfoInitial());

  void updateUserInfo(Map<String, dynamic> query) async {
    emit(UpdateUserInfoLoadingState());
    final result = await userInfoRepo.updateUserInfo(query: query);
    result.fold(
      (failure) => emit(UpdateUserInfoFailedState(failure.message)),
      (_) => emit(
        const UpdateUserInfoSuccessState(
          "تم تحديث البيانات بنجاح",
        ),
      ),
    );
  }

  void uploadImage(File image) async {
    emit(UploadImageLoadingState());
    final result = await imagesRepo!.uploadImage(image: image);

    result.fold((failure) => emit(UploadImageFailedState(failure.message)), (
      url,
    ) async {
      var result = await userInfoRepo.updateUserInfo(query: {"imageUrl": url});
      result.fold(
        (failure) => emit(const UploadImageFailedState("لم يتم تحميل الصورة")),
        (_) {
          emit(const UploadImageSuccessState("تم تحميل الصورة بنجاح"));
        },
      );
    });
  }
}
