import 'package:flutter/material.dart';

import '../../../domain/entities/bottom_navigation_bar_entity.dart';
import 'active_icon.dart';
import 'in_active_icon.dart';

class NavigationBarIcon extends StatelessWidget {
  final bool isActive;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  const NavigationBarIcon({
    super.key,
    required this.isActive,
    required this.bottomNavigationBarEntity,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child:
          isActive
              ? ActiveIcon(
                key: ValueKey('${bottomNavigationBarEntity.title}_active'),
                activeIconPath: bottomNavigationBarEntity.activeIconPath,
                title: bottomNavigationBarEntity.title,
              )
              : InActiveIcon(
                key: ValueKey('${bottomNavigationBarEntity.title}_inactive'),
                inactiveIconPath: bottomNavigationBarEntity.inActiveIconPath,
              ),
    );
  }
}
