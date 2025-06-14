import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/custom_progress_hud.dart';
import '../../../../../core/common/show_snack_bar.dart';
import '../../manager/add_order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  final Widget child;

  const AddOrderCubitBlocConsumer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      builder:
          (context, state) => CustomProgressHUD(
            isLoading: state is AddOrderLoading,
            child: child,
          ),
      listener: (context, state) {
        if (state is AddOrderError) {
          ShowSnackBar.showErrorSnackBar(context, state.message);
        } else if (state is AddOrderSuccess) {
          ShowSnackBar.showSuccessSnackBar(context, 'تم الطلب بنجاح');
        }
      },
    );
  }
}
