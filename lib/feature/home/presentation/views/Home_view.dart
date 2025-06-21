import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruithub/core/repos/product_repo/product_repo.dart';
import 'package:fruithub/core/services/get_it_services.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductsCubit(productRepo: getIt.get<ProductRepo>())
                ..getBestSellProducts(),

      child: const HomeViewBody(),
    );
  }
}
