import 'package:flutter/material.dart';
import 'package:fruithub/feature/account/domain/entities/user_info_entity.dart';
import 'package:fruithub/feature/account/presentation/views/widgets/profile_cached_image.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'pick_image_widget.dart';

class ProfileInfo extends StatelessWidget {
  final UserInfoEntity userInfoEntity;

  const ProfileInfo({super.key, required this.userInfoEntity});

  @override
  Widget build(BuildContext context) {
    final imageUrl = userInfoEntity.imageUrl;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.115),
            ProfileCachedImage(imageUrl: imageUrl!),
            const Positioned(bottom: 0, right: 21, child: PickImageWidget()),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userInfoEntity.name,
              style: AppTextStyles.bold13.copyWith(
                color: const Color(0xff131F46),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              userInfoEntity.email,
              style: AppTextStyles.regular13.copyWith(
                color: const Color(0xff888FA0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
