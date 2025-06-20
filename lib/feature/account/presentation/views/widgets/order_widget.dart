import 'package:flutter/material.dart';
import 'package:fruithub/feature/account/domain/entities/order_entity.dart';

import '../../../../../core/constants/app_const.dart';
import 'order_header.dart';
import 'tracking_step_widget.dart';

class OrderWidget extends StatefulWidget {
  final OrderEntity order;
  const OrderWidget({super.key, required this.order});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool isTapped = false;

  final List<Map<String, String>> stepLabels = [
    {'status': 'pending', 'label': 'تتبع الطلب'},
    {'status': 'accepted', 'label': 'قبول الطلب'},
    {'status': 'inProgress', 'label': 'تم شحن الطلب'},
    {'status': 'outForDelivery', 'label': 'خرج للتوصيل'},
    {'status': 'delivered', 'label': 'تم التوصيل'},
  ];

  @override
  Widget build(BuildContext context) {
    final trackingSteps = buildTrackingSteps(widget.order);

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
            order: widget.order,
          ),

          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            child: ClipRect(
              child: Align(
                heightFactor: isTapped ? 1 : 0,
                child: Column(
                  children: [
                    if (isTapped)
                      const Divider(color: Color(0xffefefef), thickness: 2),
                    const SizedBox(height: 12),
                    Column(
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> buildTrackingSteps(OrderEntity order) {
    const statusOrder = [
      'pending',
      'accepted',
      'inProgress',
      'outForDelivery',
      'delivered',
    ];
    final currentStatusIndex = statusOrder.indexOf(order.status);

    return stepLabels.asMap().entries.map((entry) {
      final index = entry.key;
      final step = entry.value;
      final isActive = index <= currentStatusIndex;
      final date =
          index == 0
              ? order.getFormattedDate()
              : (isActive ? order.getFormattedDate() : 'لم يبدأ بعد');
      return {'label': step['label'], 'date': date, 'isActive': isActive};
    }).toList();
  }
}
