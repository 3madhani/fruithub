import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/helper/signout.dart';
import 'package:fruithub/feature/auth/presentation/views/signin_view.dart';

import '../../../../../core/common/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/user_info/user_info_cubit.dart';

Future<dynamic> signoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    animationStyle: const AnimationStyle(
      curve: Curves.easeInOut,

      reverseCurve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
    ),
    builder:
        (context) => Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "هل ترغب في تسجيل الخروج ؟",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bold16,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      SizedBox(
                        height: 50,
                        width: 145,
                        child: CustomPrimaryButton(
                          title: "تأكيد",
                          onPressed: () {
                            signout();
                            context.read<UserInfoCubit>().cancelSubscription();

                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              SignInView.routeName,
                              (route) => false,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 145,
                        height: 50,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            side: WidgetStateProperty.all(
                              const BorderSide(
                                color: AppColors.primaryColor,
                                width: 1.2,
                              ),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "الغاء",
                            style: AppTextStyles.bold16.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
