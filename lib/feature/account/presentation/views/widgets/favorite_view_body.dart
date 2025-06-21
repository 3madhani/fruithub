import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/feature/account/presentation/views/widgets/reactive_favorites_listener.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/common/products_grid_view.dart';
import '../../../../../core/helper/get_dummy_products.dart';
import '../../manager/fetch_favourites/fetch_favourites_cubit.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        BlocBuilder<FetchFavouritesCubit, FetchFavouritesState>(
          builder: (context, state) {
            if (state is FetchFavouritesSuccess) {
              return ReactiveFavoritesListener(
                child: ProductsGridView(products: state.products),
              );
            } else if (state is FetchFavouritesFailure) {
              return SliverToBoxAdapter(child: Text(state.message));
            } else if (state is FetchFavouritesLoading) {
              return Skeletonizer.sliver(
                enabled: true,
                child: ProductsGridView(products: getDummyProducts()),
              );
            }
            return const SliverToBoxAdapter(
              child: Text("Something went wrong"),
            );
          },
        ),
      ],
    );
  }
}
