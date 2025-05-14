import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/core/utils/app_colors.dart';

class InActiveIcon extends StatelessWidget {
  final String inactiveIconPath;

  const InActiveIcon({super.key, required this.inactiveIconPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      inactiveIconPath,
      height: 18,
      width: 18,
      color: AppColors.primaryColor,
    );
  }
}
