import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

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
            const Text("أحمد مصطفي", style: AppTextStyles.bold16),
          ],
        ),
        const Spacer(),
        Container(
          width: 34,
          height: 34,
          decoration: const ShapeDecoration(
            color: Color(0xffEEF8ED),
            shape: OvalBorder(),
          ),
          child: SvgPicture.asset(
            Assets.svgNotification,
            height: 20,
            width: 20,
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
