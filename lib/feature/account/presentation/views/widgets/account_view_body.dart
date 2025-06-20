import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/theme/theme_cubit.dart';
import 'custom_switcher_button.dart';
import 'orders_button_bloc_builder.dart';
import 'profile_info_builder.dart';
import 'profile_row_tile.dart';
import 'signout_button.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConst.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileInfoBuilder(),
              const SizedBox(height: 16),
              const Text("عام", style: AppTextStyles.semiBold13),
              const SizedBox(height: 24),
              ProfileRowTile(
                text: " الملف الشخصي",
                onTap: () {},
                iconAsset: Assets.svgUser,
              ),
              Divider(height: 24, color: Colors.grey[300], thickness: 1),

              const OrdersButtonBlocBuilder(),
              Divider(height: 24, color: Colors.grey[300], thickness: 1),
              ProfileRowTile(
                text: " المفضلة",
                onTap: () {},
                iconAsset: Assets.svgOutlineHeart,
              ),
              Divider(height: 24, color: Colors.grey[300], thickness: 1),
              ProfileRowTile(
                text: " الاشعارات",
                onTap: () {},
                iconAsset: Assets.svgNotification,
                trailing: const CustomSwitcherButton(value: true),
              ),
              Divider(height: 24, color: Colors.grey[300], thickness: 1),
              ProfileRowTile(
                text: " اللغة",
                onTap: () {},
                iconAsset: Assets.svgGlobal,
                trailing: Row(
                  children: [
                    const Text("العربية", style: AppTextStyles.regular13),
                    const SizedBox(width: 8),
                    SvgPicture.asset(Assets.svgArrowBack),
                  ],
                ),
              ),
              Divider(height: 24, color: Colors.grey[300], thickness: 1),
              ProfileRowTile(
                text: " الوضع",
                onTap: () {},
                iconAsset: Assets.svgMagicpen,
                trailing: CustomSwitcherButton(
                  value: context.watch<ThemeCubit>().state == ThemeMode.dark,
                  onTap: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                ),
              ),
              Divider(height: 24, color: Colors.grey[300], thickness: 1),

              const SizedBox(height: 24),

              const Text("المساعدة", style: AppTextStyles.semiBold13),
              const SizedBox(height: 24),
              ProfileRowTile(
                text: " من نحن",
                onTap: () {},
                iconAsset: Assets.svgInfoCircle,
              ),
              Divider(height: 24, color: Colors.grey[300], thickness: 1),
            ],
          ),
        ),

        const SizedBox(height: 80),
        const SignoutButton(),
      ],
    );
  }
}
