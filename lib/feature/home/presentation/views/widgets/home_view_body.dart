import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/search_text_field.dart';
import '../../../../../core/constants/app_const.dart';
import '../../../../../core/cubits/products_cubit/products_cubit.dart';
import 'best_seller_grid_view_bloc_builder.dart';
import 'best_seller_header.dart';
import 'custom_home_app_bar.dart';
import 'featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: AppConst.verticalPadding),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConst.horizontalPadding,
                ),

                child: CustomHomeAppBar(),
              ),
              SizedBox(height: AppConst.verticalPadding),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConst.horizontalPadding,
                ),
                child: SearchTextField(),
              ),
              SizedBox(height: 12),
              FeaturedList(),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConst.horizontalPadding,
                ),
                child: BestSellerHeader(),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
        BestSellerGridViewBlocBuilder(),
      ],
    );
  }

  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellProducts();
    super.initState();
  }
}
