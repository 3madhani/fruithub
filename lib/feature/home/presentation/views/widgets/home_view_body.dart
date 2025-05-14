import 'package:flutter/material.dart';
import 'package:fruithub/core/common/search_text_field.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/featured_item.dart';

import '../../../../../core/constants/app_const.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConst.horizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: AppConst.verticalPadding),
                CustomHomeAppBar(),
                SizedBox(height: AppConst.verticalPadding),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
