import 'package:flutter/material.dart';

import '../../../domain/entities/bottom_navigation_bar_entity.dart';
import 'navigation_bar_icon.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });

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
      child: Row(
        children:
            bottomNavigationBarItems
                .asMap()
                .entries
                .map(
                  (e) => Expanded(
                    flex: activeIndex == e.key ? 3 : 2,
                    child: GestureDetector(
                      onTap: () => onTap(e.key),
                      child: NavigationBarIcon(
                        isActive: activeIndex == e.key,
                        bottomNavigationBarEntity: e.value,
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
