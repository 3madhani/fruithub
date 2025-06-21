import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fruithub/core/utils/app_colors.dart';

import '../../../../../core/common/notification_widget.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../account/presentation/manager/user_info/user_info_cubit.dart';
import '../../../../account/presentation/manager/user_info/user_info_state.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<UserInfoCubit>().state;

    final user = state is UserInfoLoaded ? state.user : null;
    final hasValidImage =
        user?.imageUrl != null && user!.imageUrl!.trim().isNotEmpty;

    final Widget profileImage = Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      elevation: 3,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 1),
          shape: BoxShape.circle,
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[800]
                  : Colors.grey[200],
        ),
        child: ClipOval(
          child:
              hasValidImage
                  ? CachedNetworkImage(
                    imageUrl: user.imageUrl!,
                    fit: BoxFit.contain,
                    width: 44,
                    height: 44,
                    placeholder:
                        (_, __) => const Center(
                          child: SpinKitFadingCircle(
                            color: Colors.grey,
                            size: 22,
                          ),
                        ),
                    errorWidget:
                        (_, __, ___) => Image.asset(
                          Assets.imagesProfileImage,
                          fit: BoxFit.contain,
                          width: 44,
                          height: 44,
                        ),
                  )
                  : Image.asset(
                    Assets.imagesProfileImage,
                    fit: BoxFit.contain,
                    width: 44,
                    height: 44,
                  ),
        ),
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        profileImage,
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "اهلا !..",
                style: AppTextStyles.regular16.copyWith(
                  color: const Color(0xff949D9E),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child:
                    state is UserInfoLoaded
                        ? Text(
                          state.user.name,
                          key: const ValueKey('userName'),
                          style: AppTextStyles.bold16,
                        )
                        : const Text(
                          "جاري التحميل",
                          key: ValueKey('loading'),
                          style: AppTextStyles.bold16,
                        ),
              ),
            ],
          ),
        ),
        const NotificationWidget(),
      ],
    );
  }
}
