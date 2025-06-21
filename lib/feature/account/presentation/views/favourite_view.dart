import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/custom_app_bar.dart';

import '../../../../core/cubits/cubit/favorite_cubit.dart';
import '../../../../core/repos/favourite_repo/favorite_repo.dart';
import '../../../../core/services/get_it_services.dart';
import '../../../home/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../../domain/repos/user_info_repo.dart';
import '../manager/user_info/user_info_cubit.dart';
import 'widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  static const routeName = 'favourite_view';

  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteCubit(getIt.get<FavouritesRepo>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  UserInfoCubit(getIt.get<UserInfoRepo>())..fetchUserInfo(),
        ),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: Scaffold(
        appBar: buildAppBar(context: context, title: "المفضلة"),
        body: const FavouriteViewBody(),
      ),
    );
  }
}
