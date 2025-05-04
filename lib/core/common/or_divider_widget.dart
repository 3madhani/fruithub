import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0xffDCDEDE))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'أو',
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold16,
          ),
        ),
        Expanded(child: Divider(color: Color(0xffDCDEDE))),
      ],
    );
  }
}
