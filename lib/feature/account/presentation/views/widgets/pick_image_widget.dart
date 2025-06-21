import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/common/show_snack_bar.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../manager/update_info/update_info_cubit.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateInfoCubit, UpdateInfoState>(
      listener: (context, state) {
        if (state is UploadImageFailedState) {
          ShowSnackBar.showErrorSnackBar(context, state.message);
        } else if (state is UploadImageSuccessState) {
          ShowSnackBar.showSuccessSnackBar(context, state.message);
        }
      },
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        elevation: 2,
        child: InkWell(
          onTap: () => _pickAndUploadImage(context),
          customBorder: const CircleBorder(),
          child: Container(
            height: 34,
            width: 34,
            padding: const EdgeInsets.all(6),
            decoration: ShapeDecoration(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[800]
                      : Colors.grey[200],
              shape: const CircleBorder(
                side: BorderSide(color: Colors.white, width: 2),
              ),
            ),
            child: SvgPicture.asset(
              Assets.svgCamera,
              fit: BoxFit.contain,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickAndUploadImage(BuildContext context) async {
    try {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        if (context.mounted) {
          context.read<UpdateInfoCubit>().uploadImage(File(image.path));
        }
      }
    } catch (e) {
      if (context.mounted) {
        ShowSnackBar.showErrorSnackBar(context, "فشل اختيار الصورة: $e");
      }
    }
  }
}
