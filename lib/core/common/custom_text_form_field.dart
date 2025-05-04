import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool isPasswordField;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    required this.isPasswordField,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: AppTextStyles.semiBold16.copyWith(color: const Color(0xff1F2326)),
      decoration: InputDecoration(
        suffixIcon: isPasswordField ? suffixIcon : null,
        hintText: hintText,
        hintStyle: AppTextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),
        ),
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        border: buildBorder(),
        focusedBorder: buildBorder(AppColors.primaryLightColor),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? borderColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: borderColor ?? const Color(0xffE6E9EA)),
    );
  }
}
