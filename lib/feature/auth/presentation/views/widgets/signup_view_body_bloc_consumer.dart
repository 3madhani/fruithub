import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/build_snack_bar.dart';
import 'package:fruithub/core/common/custom_progress_hud.dart';

import '../../cubits/signup_cubit/signup_cubit.dart';
import 'sign_up_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          BuildSnackBar.buildErrorSnackBar(context, state.error);
        } else if (state is SignupSuccess) {
          BuildSnackBar.buildSuccessSnackBar(
            context,
            '${state.userEntity.name} تم التسجيل بنجاح',
          );
          // Navigate back after snackbar duration
          // Future.delayed(const Duration(seconds: 2), () {
          // Navigator.of(context).pop();
          // });
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SignupLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
