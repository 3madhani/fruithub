import 'package:flutter/material.dart';

import '../constants/app_const.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'notification_widget.dart';

AppBar showMainAppBar({
  required BuildContext context,
  required String title,
  bool isLeadingVisible = true,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leadingWidth: 70,
    leading: Visibility(
      visible: isLeadingVisible,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConst.horizontalPadding,
        ),
        child: IconButton(
          highlightColor: AppColors.primaryLightColor.withOpacity(0.3),
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all(const Size(44, 44)),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            shape: WidgetStateProperty.all(
              const CircleBorder(
                side: BorderSide(color: Color(0xffF1F1F5), width: 1),
              ),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppTextStyles.bold19,
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConst.horizontalPadding),
        child: NotificationWidget(),
      ),
    ],
  );
}
