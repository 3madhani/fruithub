import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/build_snack_bar.dart';
import 'package:fruithub/feature/home/presentation/views/main_view.dart';

import '../../../../../core/common/custom_progress_hud.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SiginState>(
      listener: (context, state) {
        if (state is SigninFailure) {
          BuildSnackBar.buildErrorSnackBar(context, state.error);
        } else if (state is SigninSuccess) {
          Navigator.pushNamed(context, MainView.routeName);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SigninLoading ? true : false,
          child: const SigninViewBody(),
        );
      },
    );
  }
}
