import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  bool isLeadingVisible = true,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading:
        isLeadingVisible
            ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new),
            )
            : const SizedBox.shrink(),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppTextStyles.bold19,
    ),
  );
}
