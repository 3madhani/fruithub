import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/core/utils/app_colors.dart';

class InActiveIcon extends StatelessWidget {
  final String inactiveIconPath;

  const InActiveIcon({super.key, required this.inactiveIconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      color: Colors.transparent,
      child: SvgPicture.asset(
        inactiveIconPath,
        height: 20,
        width: 20,
        color: AppColors.primaryColor,
      ),
    );
  }
}
