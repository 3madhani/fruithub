import 'package:flutter/material.dart';
import 'package:fruithub/core/common/products_grid_view.dart';

import '../../../../../core/helper/get_dummy_products.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [ProductsGridView(products: getDummyProducts())],
    );
  }
}
