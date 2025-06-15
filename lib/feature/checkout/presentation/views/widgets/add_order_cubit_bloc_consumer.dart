import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/custom_progress_hud.dart';
import '../../../../../core/common/custom_snackbar_over_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../manager/add_order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  final Widget child;
  final GlobalKey buttonKey;

  const AddOrderCubitBlocConsumer({
    super.key,
    required this.child,
    required this.buttonKey,
  });

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
          showCustomSnackbarOverButton(
            context: context,
            buttonKey: buttonKey,
            message: "فشل عملية الدفع",
            backgroundColor: Colors.red,
          );
        } else if (state is AddOrderSuccess) {
          showCustomSnackbarOverButton(
            context: context,
            buttonKey: buttonKey,
            message: "تمت عملية الدفع بنجاح",
            backgroundColor: AppColors.primaryLightColor,
          );
        }
      },
    );
  }
}
