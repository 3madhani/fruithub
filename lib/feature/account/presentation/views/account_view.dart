import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/services/get_it_services.dart';
import 'package:fruithub/feature/account/presentation/manager/update_info/update_info_cubit.dart';

import '../../../../core/repos/images_repo/images_repo.dart';
import '../../domain/repos/user_info_repo.dart';
import 'widgets/account_view_body.dart';

class AccountView extends StatelessWidget {
  static const String routeName = 'account_view';

  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              UpdateInfoCubit(getIt<ImagesRepo>(), getIt<UserInfoRepo>()),
      child: const AccountViewBody(),
    );
  }
}
