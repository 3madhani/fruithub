import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../feature/account/presentation/manager/user_info/user_info_cubit.dart';
import '../../feature/account/presentation/manager/user_info/user_info_state.dart';
import '../cubits/cubit/add_favorite_cubit.dart';
import '../entities/product_entity.dart';
import '../utils/app_assets.dart';

class FavoriteButton extends StatelessWidget {
  final ProductEntity product;

  const FavoriteButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool isFav = false;

    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoLoaded) {
          isFav = state.user.favourites.any((fav) => fav == product.code);
        }

        return GestureDetector(
          onTap: () {
            context.read<AddFavoriteCubit>().addFavorite(code: product.code);
            // 3. 🧠 Optimistically remove from UI
          },
          child: SvgPicture.asset(
            isFav ? Assets.svgHeart : Assets.svgOutlineHeart,
            height: 30,
            width: 30,
            color: isFav ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
