import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/custom_progress_hud.dart';
import 'package:fruithub/core/common/show_snack_bar.dart';

import '../../cubits/signup_cubit/signup_cubit.dart';
import 'sign_up_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          ShowSnackBar.showErrorSnackBar(context, state.error);
        } else if (state is SignupSuccess) {
          ShowSnackBar.showSuccessSnackBar(
            context,
            '${state.userEntity.name} تم انشاء حسابك بنجاح قم بتسجيل الدخول',
          );

          // Save navigator before async gap
          final navigator = Navigator.of(context);

          // Navigate back after snackbar duration
          Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
            navigator.pop();
          });
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
