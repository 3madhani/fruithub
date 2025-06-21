import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_info_entity.dart';
import '../../../domain/repos/user_info_repo.dart';
import 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final UserInfoRepo userInfoRepo;
  StreamSubscription? subscription;

  UserInfoCubit(this.userInfoRepo) : super(UserInfoInitial());

  UserInfoEntity get userInfo => (state as UserInfoLoaded).user;

  void fetchUserInfo() {
    emit(UserInfoLoading());
    subscription = userInfoRepo.getUserInfo().listen((event) {
      event.fold(
        (failure) => emit(UserInfoError(failure.message)),
        (user) => emit(UserInfoLoaded(user)),
      );
    });
  }

  void cancelSubscription() {
    subscription?.cancel();
    subscription = null;
  }

  @override
  Future<void> close() {
    cancelSubscription();
    return super.close();
  }
}

