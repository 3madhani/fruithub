import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/feature/account/domain/entities/user_info_entity.dart';

import '../../../domain/repos/user_info_repo.dart';
import 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final UserInfoRepo userInfoRepo;

  UserInfoEntity get userInfo => (state as UserInfoLoaded).user;

  StreamSubscription? subscription;
  UserInfoCubit(this.userInfoRepo) : super(UserInfoInitial());

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }

  void fetchUserInfo() {
    emit(UserInfoLoading());
    subscription = userInfoRepo.getUserInfo().listen((event) {
      event.fold(
        (failure) => emit(UserInfoError(failure.message)),
        (user) => emit(UserInfoLoaded(user)),
      );
    });
  }
}
