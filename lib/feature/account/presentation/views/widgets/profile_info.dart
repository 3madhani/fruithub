import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/feature/account/domain/entities/user_info_entity.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProfileInfo extends StatelessWidget {
  final UserInfoEntity userInfoEntity;

  const ProfileInfo({super.key, required this.userInfoEntity});

  @override
  Widget build(BuildContext context) {
    final imageUrl = userInfoEntity.imageUrl;
    final bool isValidUrl = imageUrl != null && imageUrl.isNotEmpty;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.098),
            CircleAvatar(
              radius: 38.5,
              backgroundColor: Colors.grey[200],
              child: ClipOval(
                child:
                    isValidUrl
                        ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          width: 75,
                          height: 75,
                          placeholder:
                              (context, url) => const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                          errorWidget:
                              (context, url, error) => _buildFallbackText(),
                        )
                        : _buildFallbackText(),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 21,
              child: Container(
                height: 32,
                width: 32,
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                  ),
                  color: Colors.grey[200],
                ),
                child: SvgPicture.asset(Assets.svgCamera, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
        const SizedBox(width: 24),
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

  Widget _buildFallbackText() {
    return Center(child: Image.asset(Assets.imagesProfileImage));
  }
}
