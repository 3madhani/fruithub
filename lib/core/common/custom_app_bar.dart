import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/core/utils/app_assets.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  bool isLeadingVisible = true,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading:
        isLeadingVisible
            ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Center(
                child: SvgPicture.asset(
                  Assets.svgArrowLeft,
                  height: 34,
                  width: 34,
                ),
              ),
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
