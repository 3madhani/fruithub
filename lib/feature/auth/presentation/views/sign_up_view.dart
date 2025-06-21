import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/custom_app_bar.dart';
import 'package:fruithub/core/services/get_it_services.dart';
import 'package:fruithub/feature/auth/domain/repos/auth_repo.dart';

import '../cubits/signup_cubit/signup_cubit.dart';
import 'widgets/signup_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = 'signUpView';

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          title: "حساب جديد",
          context: context,
          isLeadingVisible: false,
        ),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
