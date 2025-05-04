import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruithub/core/utils/app_assets.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  const CustomCheckBox({super.key, required this.isChecked, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle checkbox tap here
        // You can use a callback or state management to update the isChecked value
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        height: 24,
        width: 24,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isChecked ? Colors.transparent : const Color(0xffDCDEDE),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          color: isChecked ? AppColors.primaryColor : Colors.white,
        ),
        child:
            isChecked
                ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SvgPicture.asset(Assets.svgCheck),
                )
                : const SizedBox.shrink(),
      ),
    );
  }
}
