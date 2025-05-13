import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

import '../../../../../core/utils/app_assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage, width: 48, height: 48),
      title: Text(
        "صباح الخير !..",
        textAlign: TextAlign.right,
        style: AppTextStyles.regular16.copyWith(color: const Color(0xff949D9E)),
      ),
      subtitle: const Text("أحمد مصطفي", style: AppTextStyles.bold16),
      trailing: Container(
        padding: const EdgeInsets.all(12),
        decoration: const ShapeDecoration(
          color: Color(0xffEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.svgNotification, fit: BoxFit.contain),
      ),
    );
  }
}
