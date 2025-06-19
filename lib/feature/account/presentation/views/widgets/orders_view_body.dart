import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/core/constants/app_const.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

import '../../../../../core/utils/app_assets.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppConst.verticalPadding),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(
            left: AppConst.horizontalPadding,
            right: AppConst.horizontalPadding,
            bottom: 8,
          ),
          decoration: const ShapeDecoration(
            shape: ContinuousRectangleBorder(),
            color: Color(0xfff8f9f9),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Color(0xFFebf9f1),
                ),
                child: SvgPicture.asset(Assets.svgBoxOrder),
              ),
              const SizedBox(width: 8),
              const Column(
                children: [
                  Row(
                    children: [
                      Text("طلب رقم: 1234567#", style: AppTextStyles.bold13),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
