import 'package:flutter/material.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/cart_header.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/cart_item.dart';

import '../../../../../core/common/custom_app_bar.dart';
import '../../../../../core/constants/app_const.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConst.horizontalPadding,
                ),
                child: CartItem(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
