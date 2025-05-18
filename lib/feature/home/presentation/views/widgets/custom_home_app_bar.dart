import 'package:flutter/material.dart';
import 'package:fruithub/core/helper/get_user_entity_function.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

import '../../../../../core/common/notification_widget.dart';
import '../../../../../core/utils/app_assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesProfileImage, width: 44, height: 44),
        const SizedBox(width: 11),
        Column(
          children: [
            Text(
              "صباح الخير !..",
              textAlign: TextAlign.right,
              style: AppTextStyles.regular16.copyWith(
                color: const Color(0xff949D9E),
              ),
            ),
            Text(getUserEntity().name, style: AppTextStyles.bold16),
          ],
        ),
        const Spacer(),
        const NotificationWidget(),
      ],
    );
  }
}
