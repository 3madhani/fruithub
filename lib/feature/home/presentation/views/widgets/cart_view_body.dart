import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/cart_header.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/cart_items_list.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/custom_divider.dart';

import '../../../../../core/common/custom_app_bar.dart';
import '../../../../../core/constants/app_const.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: AppConst.verticalPadding),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConst.horizontalPadding,
                    ),
                    child: buildAppBar(context: context, title: 'السلة'),
                  ),
                  const SizedBox(height: AppConst.verticalPadding),
                  const CartHeader(),
                  const SizedBox(height: AppConst.verticalPadding),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: CustomDivider()),
            const CartItemsList(cartItems: []),
            const SliverToBoxAdapter(child: CustomDivider()),
          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.07,
          left: 16,
          right: 16,
          child: CustomPrimaryButton(
            title: "الدفع  120جنيه",
            onPressed: () {
              // Add your payment logic here
            },
          ),
        ),
      ],
    );
  }
}
