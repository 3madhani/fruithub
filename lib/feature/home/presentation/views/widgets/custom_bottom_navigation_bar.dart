import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';

class ActiveIcon extends StatelessWidget {
  final String activeIconPath;

  const ActiveIcon({super.key, required this.activeIconPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(activeIconPath);
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: const NavigationBarIcon(isActive: true),
    );
  }
}

class InActiveIcon extends StatelessWidget {
  final String inactiveIconPath;

  const InActiveIcon({super.key, required this.inactiveIconPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(inactiveIconPath);
  }
}

class NavigationBarIcon extends StatelessWidget {
  final bool isActive;
  const NavigationBarIcon({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? const ActiveIcon(activeIconPath: Assets.svgActiveHome)
        : const InActiveIcon(inactiveIconPath: Assets.svgInactiveHome);
  }
}
