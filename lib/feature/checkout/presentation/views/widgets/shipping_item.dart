import 'package:flutter/material.dart';
import 'package:fruithub/core/constants/app_const.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'active_shipping_item_dot.dart';
import 'inactive_shipping_item_dot.dart';

class ShippingItem extends StatelessWidget {
  final String shippingMethod;
  final String deliveryMethod;
  final String shippingCost;
  final bool isSelected;
  final VoidCallback? onTap;

  const ShippingItem({
    super.key,
    required this.shippingMethod,
    required this.deliveryMethod,
    required this.shippingCost,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(AppConst.horizontalPadding),
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippItemDot()
                  : const InActiveShippItemDot(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shippingMethod, style: AppTextStyles.semiBold13),
                  const SizedBox(height: 6),
                  Text(
                    deliveryMethod,
                    style: AppTextStyles.regular13.copyWith(
                      color: const Color(0x50000000),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  "$shippingCost جنيه",
                  style: AppTextStyles.bold13.copyWith(
                    color: const Color(0xff3A8B33),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
