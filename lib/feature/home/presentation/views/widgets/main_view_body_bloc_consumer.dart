import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/show_snack_bar.dart';
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
          ShowSnackBar.showSuccessSnackBar(
            context,
            'تم إضافة المنتج إلى السلة بنجاح!',
          );
        } else if (state is CartItemRemoved) {
          ShowSnackBar.showSuccessSnackBar(
            context,
            'تم حذف المنتج من السلة بنجاح!',
          );
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
