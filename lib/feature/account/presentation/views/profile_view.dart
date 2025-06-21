import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/feature/account/presentation/manager/update_info/update_info_cubit.dart';

import '../../../../core/common/custom_app_bar.dart';
import '../../../../core/services/get_it_services.dart';
import '../../domain/repos/user_info_repo.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  static const routeName = 'profile_view';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateInfoCubit(null, getIt<UserInfoRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: "حسابي"),
        body: const ProfileViewBody(),
      ),
    );
  }
}
