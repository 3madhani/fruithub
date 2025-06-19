import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repos/user_info_repo.dart';
import 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final UserInfoRepo userInfoRepo;

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
