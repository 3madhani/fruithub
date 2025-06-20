import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruithub/core/repos/product_repo/product_repo.dart';
import 'package:fruithub/core/services/get_it_services.dart';

import '../../../../core/cubits/cubit/favorite_cubit.dart';
import '../../../../core/repos/favourite_repo/favorite_repo.dart';
import '../../../account/domain/repos/user_info_repo.dart';
import '../../../account/presentation/manager/user_info/user_info_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  ProductsCubit(productRepo: getIt.get<ProductRepo>())
                    ..getBestSellProducts(),
        ),
        BlocProvider(
          create:
              (context) =>
                  UserInfoCubit(getIt.get<UserInfoRepo>())..fetchUserInfo(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(getIt<FavouritesRepo>()),
        ),
      ],
      child: const HomeViewBody(),
    );
  }
}
