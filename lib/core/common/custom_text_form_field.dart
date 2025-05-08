import 'package:flutter/material.dart';
import 'package:fruithub/core/helper/detect_email_and_password.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool isPasswordField;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    this.isPasswordField = false,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال $hintText';
        }
        if (isPasswordField) {
          if (!DetectEmailAndPassword.isValidPassword(value)) {
            return 'كلمة المرور يجب أن تحتوي على 8 أحرف على الأقل، بما في ذلك حرف كبير ورقم ورمز خاص';
          }
        } else if (keyboardType == TextInputType.emailAddress) {
          if (!DetectEmailAndPassword.isValidEmail(value)) {
            return 'الرجاء إدخال بريد إلكتروني صالح';
          }
        } else if (keyboardType == TextInputType.name) {
          return null;
        }
        return null;
      },
      keyboardType: keyboardType,
      obscureText: isPasswordField,
      style: AppTextStyles.semiBold16.copyWith(color: const Color(0xff1F2326)),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
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
