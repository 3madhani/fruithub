import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'tracking_step_widget.dart';

class OrderHeader extends StatelessWidget {
  final bool isTapped;
  final VoidCallback onTap;

  const OrderHeader({super.key, required this.isTapped, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 19, bottom: 19, right: 12, left: 19),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Color(0xFFebf9f1),
            ),
            child: SvgPicture.asset(Assets.svgBoxOrder),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("طلب رقم: 1234567#", style: AppTextStyles.bold13),
                const SizedBox(height: 4),
                Text(
                  "تم الطلب :22 مارس ,2024",
                  style: AppTextStyles.regular11.copyWith(
                    color: const Color(0xff949D9E),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "عدد الطلبات : ",
                            style: AppTextStyles.regular13.copyWith(
                              color: const Color(0xff949D9E),
                            ),
                          ),
                          const TextSpan(
                            text: "10",
                            style: AppTextStyles.bold13,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(" 250 جنية", style: AppTextStyles.bold13),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: isTapped ? 0.5 : 0.0,
              child: SvgPicture.asset(
                Assets.svgArrowDown,
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool isTapped = false;

  final List<Map<String, dynamic>> trackingSteps = [
    {'label': 'تتبع الطلب', 'date': '22 مارس , 2024', 'isActive': true},
    {'label': 'قبول الطلب', 'date': '22 مارس , 2024', 'isActive': true},
    {'label': 'جارٍ التحضير', 'date': 'لم يبدأ بعد', 'isActive': true},
    {'label': 'تم الشحن', 'date': 'لم يبدأ بعد', 'isActive': true},
    {'label': 'تم التوصيل', 'date': 'لم يبدأ بعد', 'isActive': false},
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(
        left: AppConst.horizontalPadding,
        right: AppConst.horizontalPadding,
        bottom: 8,
      ),
      decoration: const ShapeDecoration(
        shape: ContinuousRectangleBorder(),
        color: Color(0xfff8f9f9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderHeader(
            isTapped: isTapped,
            onTap: () => setState(() => isTapped = !isTapped),
          ),
          if (isTapped) const Divider(color: Color(0xffefefef), thickness: 2),
          const SizedBox(height: 12),
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            child: ClipRect(
              child: Align(
                heightFactor: isTapped ? 1 : 0,
                child: Column(
                  children: List.generate(trackingSteps.length, (index) {
                    final step = trackingSteps[index];
                    final nextStep =
                        index < trackingSteps.length - 1
                            ? trackingSteps[index + 1]
                            : null;

                    final showConnector =
                        step['isActive'] == true &&
                        nextStep != null &&
                        nextStep['isActive'] == true;

                    return TrackingStepWidget(
                      isActive: step['isActive'],
                      showConnector: showConnector,
                      label: step['label'],
                      date: step['date'],
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
