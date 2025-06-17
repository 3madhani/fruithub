import 'package:flutter/material.dart';

import '../../../../../core/common/search_text_field.dart';
import '../../../../../core/constants/app_const.dart';
import 'best_seller_header.dart';
import 'custom_home_app_bar.dart';
import 'featured_list.dart';
import 'products_grid_view_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
        ProductsGridViewBlocBuilder(),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
      ],
    );
  }
}
