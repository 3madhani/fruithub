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
          // Dot and vertical line
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(radius: 5, backgroundColor: pointColor),
              showConnector
                  ? Container(
                    width: 2,
                    height: 40,
                    color: AppColors.primaryColor,
                  )
                  : const SizedBox(height: 40),
            ],
          ),
          const SizedBox(width: 8),
          // Text details
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.semiBold13.copyWith(color: textColor),
                ),
                const Spacer(),
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
