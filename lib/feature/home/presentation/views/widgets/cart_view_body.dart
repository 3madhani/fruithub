import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/cart_header.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/cart_items_list.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/custom_divider.dart';

import '../../../../../core/common/custom_app_bar.dart';
import '../../../../../core/constants/app_const.dart';
import 'cutom_cart_button.dart';

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
                    child: buildAppBar(
                      context: context,
                      title: 'السلة',
                      isLeadingVisible: false,
                    ),
                  ),
                  const SizedBox(height: AppConst.verticalPadding),
                  const CartHeader(),
                  const SizedBox(height: AppConst.verticalPadding),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child:
                  context.read<CartCubit>().cartEntity.cartItems.isEmpty
                      ? const SizedBox.shrink()
                      : const CustomDivider(),
            ),
            CartItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child:
                  context.read<CartCubit>().cartEntity.cartItems.isEmpty
                      ? const SizedBox.shrink()
                      : const CustomDivider(),
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.07,
          left: 16,
          right: 16,
          child: const CustomCartButton(),
        ),
      ],
    );
  }
}
