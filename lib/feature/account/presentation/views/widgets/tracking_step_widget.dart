import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class TrackingStepWidget extends StatelessWidget {
  final bool isActive;
  final bool showConnector;
  final String label;
  final String date;

  const TrackingStepWidget({
    super.key,
    required this.isActive,
    required this.showConnector,
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final pointColor =
        isActive ? AppColors.primaryColor : const Color(0xffEBEBEB);
    final textColor = isActive ? Colors.black : const Color(0xff949D9E);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dot aligned vertically with text
              Container(
                width: 17,
                height: 17,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pointColor,
                ),
              ),
              if (showConnector)
                Container(width: 2, height: 30, color: AppColors.primaryColor)
              else
                const SizedBox(height: 30),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,

                  style: AppTextStyles.semiBold13.copyWith(color: textColor),
                ),
                Text(
                  date,
                  style: AppTextStyles.semiBold13.copyWith(
                    color: const Color(0xff949D9E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
