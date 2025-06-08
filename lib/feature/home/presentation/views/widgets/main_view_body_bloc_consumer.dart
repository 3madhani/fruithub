import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/build_snack_bar.dart';
import 'package:fruithub/feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';

import 'main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  final int currentViewIndex;
  const MainViewBodyBlocConsumer({super.key, required this.currentViewIndex});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartProductAdded) {
          BuildSnackBar.buildSuccessSnackBar(
            context,
            'المنتج أضيف إلى السلة بنجاح!',
          );
        } else if (state is CartProductRemoveed) {
          BuildSnackBar.buildErrorSnackBar(
            context,
            'المنتج تمت إزالته من السلة بنجاح!',
          );
        } else if (state is CarttInitial) {
          // Initial state, do nothing
        } else {
          BuildSnackBar.buildErrorSnackBar(context, 'An error occurred!');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
