import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  const CustomErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: AppTextStyles.regular16.copyWith(color: Colors.red),
      maxLines: 3,
      textAlign: TextAlign.center,
    );
  }
}
