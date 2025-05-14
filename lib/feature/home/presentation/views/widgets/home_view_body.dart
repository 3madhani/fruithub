import 'package:flutter/material.dart';
import 'package:fruithub/core/common/fruit_item.dart';
import 'package:fruithub/core/common/search_text_field.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/featured_list.dart';

import '../../../../../core/constants/app_const.dart';
import 'best_seller_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: AppConst.verticalPadding),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConst.horizontalPadding,
                ),

                child: CustomHomeAppBar(),
              ),
              const SizedBox(height: AppConst.verticalPadding),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConst.horizontalPadding,
                ),
                child: SearchTextField(),
              ),
              const SizedBox(height: 12),
              const FeaturedList(),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.horizontalPadding,
                ),
                child: BestSellerHeader(onTap: () {}),
              ),
              const SizedBox(height: 12),

              const FruitItem(),
            ],
          ),
        ),
      ],
    );
  }
}
