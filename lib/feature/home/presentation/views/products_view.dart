import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../../../core/services/get_it_services.dart';
import 'widgets/product_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductsCubit(productRepo: getIt.get<ProductRepo>())
                ..getProducts(),
      child: const ProductViewBody(),
    );
  }
}
