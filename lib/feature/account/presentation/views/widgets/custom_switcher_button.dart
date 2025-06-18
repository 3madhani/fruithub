import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomSwitcherButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool value;
  const CustomSwitcherButton({super.key, this.onTap, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 29,
        height: 17,
        decoration: BoxDecoration(
          color:
              value
                  ? AppColors.primaryLightColor
                  : const Color(0xff888FA0).withOpacity(.5),
          border: Border.all(
            color:
                value
                    ? AppColors.primaryLightColor
                    : const Color(0xff888FA0).withOpacity(.5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(36.5),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: value ? Alignment.centerLeft : Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff888FA0).withOpacity(.5),
                  width: .4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
