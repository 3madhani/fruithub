import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../manager/user_info/user_info_cubit.dart';
import '../../manager/user_info/user_info_state.dart';
import '../orders_view.dart';
import 'profile_row_tile.dart';

class OrdersButtonBlocBuilder extends StatelessWidget {
  const OrdersButtonBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        return ProfileRowTile(
          text: " طلباتي",
          onTap: () {
            Navigator.pushNamed(
              context,
              OrdersView.routeName,
              arguments: context.read<UserInfoCubit>().userInfo,
            );
          },
          iconAsset: Assets.svgBox,
        );
      },
    );
  }
}
