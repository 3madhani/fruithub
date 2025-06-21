import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/custom_app_bar.dart';
import '../../../../core/repos/favourite_repo/favorite_repo.dart';
import '../../../../core/services/get_it_services.dart';
import '../manager/fetch_favourites/fetch_favourites_cubit.dart';
import '../manager/user_info/user_info_cubit.dart';
import 'widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  static const routeName = 'favourite_view';

  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => FetchFavouritesCubit(
            getIt.get<FavouritesRepo>(),
          )..fetchFavourites(context.read<UserInfoCubit>().userInfo.favourites),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: "المفضلة"),
        body: const FavouriteViewBody(),
      ),
    );
  }
}
