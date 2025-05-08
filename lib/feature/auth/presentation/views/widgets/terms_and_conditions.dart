import 'package:flutter/material.dart';
import 'package:fruithub/feature/auth/presentation/views/widgets/custom_check_box.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class TermsAndConditions extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const TermsAndConditions({super.key, required this.onChanged});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChanged: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Text.rich(
            TextSpan(
              text: "من خلال إنشاء حساب ، فإنك توافق على",
              style: AppTextStyles.semiBold13.copyWith(
                color: const Color(0xff949D9E),
              ),
              children: [
                TextSpan(
                  text: " الشروط والأحكام الخاصة بنا",
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.primaryLightColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
