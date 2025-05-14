import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ActiveIcon extends StatelessWidget {
  final String activeIconPath;
  final String title;

  const ActiveIcon({
    super.key,
    required this.activeIconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xffEEEEEE),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primaryColor,
              ),
              child: Center(
                child: SvgPicture.asset(activeIconPath, height: 18, width: 18),
              ),
            ),
            const SizedBox(width: 5),
            Flexible(
              // This prevents overflow
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyles.semiBold11.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
