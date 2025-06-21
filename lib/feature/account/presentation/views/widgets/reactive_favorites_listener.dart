import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_favourites/fetch_favourites_cubit.dart';
import '../../manager/user_info/user_info_cubit.dart';
import '../../manager/user_info/user_info_state.dart';

class ReactiveFavoritesListener extends StatelessWidget {
  final Widget child;

  const ReactiveFavoritesListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserInfoCubit, UserInfoState>(
      listenWhen: (previous, current) {
        if (previous is UserInfoLoaded && current is UserInfoLoaded) {
          final oldSet = {...previous.user.favourites};
          final newSet = {...current.user.favourites};
          return oldSet.length != newSet.length || !oldSet.containsAll(newSet);
        }
        return true;
      },
      listener: (context, state) {
        if (state is UserInfoLoaded) {
          context.read<FetchFavouritesCubit>().fetchFavourites(
            state.user.favourites,
          );
        }
      },
      child: child,
    );
  }
}
