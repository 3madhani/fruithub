import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProfileRowTile extends StatelessWidget {
  final String text;
  final String iconAsset;
  final VoidCallback? onTap;
  final Widget? trailing;

  const ProfileRowTile({
    super.key,
    required this.text,
    required this.iconAsset,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Row(
            children: [
              SvgPicture.asset(iconAsset),
              const SizedBox(width: 8),
              Text(
                text,
                style: AppTextStyles.semiBold13.copyWith(
                  color: const Color(0xff949D9E),
                ),
              ),
            ],
          ),
          const Spacer(),
          trailing ?? SvgPicture.asset(Assets.svgArrowBack),
        ],
      ),
    );
  }
}
