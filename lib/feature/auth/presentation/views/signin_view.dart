import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/services/get_it_services.dart';
import 'package:fruithub/feature/auth/domain/repos/auth_repo.dart';

import '../../../../core/common/custom_app_bar.dart';
import '../cubits/signin_cubit/signin_cubit.dart';
import 'widgets/signin_view_body.dart';

class SignInView extends StatelessWidget {
  static const String routeName = 'signInView';

  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: 'تسجيل الدخول'),
        body: const SigninViewBody(),
      ),
    );
  }
}
