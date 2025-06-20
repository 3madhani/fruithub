import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/notification_widget.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../account/presentation/manager/user_info/user_info_cubit.dart';
import '../../../../account/presentation/manager/user_info/user_info_state.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesProfileImage, width: 44, height: 44),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "اهلا !..",
                textAlign: TextAlign.right,
                style: AppTextStyles.regular16.copyWith(
                  color: const Color(0xff949D9E),
                ),
              ),
              BlocBuilder<UserInfoCubit, UserInfoState>(
                builder: (context, state) {
                  if (state is UserInfoLoaded) {
                    return Text(state.user.name, style: AppTextStyles.bold16);
                  } else {
                    return const Text(
                      "جاري التحميل",
                      style: AppTextStyles.bold16,
                    );
                  }
                },
              ),
            ],
          ),
        ),
        const NotificationWidget(),
      ],
    );
  }
}
