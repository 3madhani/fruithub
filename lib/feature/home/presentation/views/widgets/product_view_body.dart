import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/build_main_app_bar.dart';
import 'package:fruithub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/products_view_header.dart';

import '../../../../../core/common/search_text_field.dart';
import '../../../../../core/constants/app_const.dart';
import 'products_grid_view_bloc_builder.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

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
                child: buildMainAppBar(
                  context: context,
                  title: 'المنتجات',
                  isLeadingVisible: false,
                ),
              ),
              const SizedBox(height: AppConst.verticalPadding),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConst.horizontalPadding,
                ),
                child: SearchTextField(),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.horizontalPadding,
                ),
                child: ProductsViewHeader(
                  productsNumber: context.read<ProductsCubit>().productsCount,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        const ProductsGridViewBlocBuilder(),
      ],
    );
  }
}
