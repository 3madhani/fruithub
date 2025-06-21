import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_services.dart';
import '../../domain/repos/user_info_repo.dart';
import '../manager/user_info/user_info_cubit.dart';
import 'widgets/account_view_body.dart';

class AccountView extends StatelessWidget {
  static const String routeName = 'account_view';

  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserInfoCubit(getIt.get<UserInfoRepo>());
      },
      child: const AccountViewBody(),
    );
  }
}
