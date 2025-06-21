import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/products_grid_view.dart';
import 'package:fruithub/feature/account/presentation/manager/user_info/user_info_cubit.dart';

import '../../../../../core/helper/get_dummy_products.dart';
import '../../manager/user_info/user_info_state.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        BlocBuilder<UserInfoCubit, UserInfoState>(
          builder: (context, state) {
            if (state is UserInfoLoaded) {
              return ProductsGridView(
                products:
                    state.user.favourites.map((e) => e.productEntity).toList(),
              );
            }
            return ProductsGridView(products: getDummyProducts());
          },
        ),
      ],
    );
  }
}
