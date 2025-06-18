import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .098),
            CircleAvatar(
              radius: 37.5,
              child: CachedNetworkImage(
                imageUrl: "",
                placeholder:
                    (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 20,
              child: Center(
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                    color: Color(0xFFf9f9f9),
                  ),
                  child: SvgPicture.asset(Assets.svgCamera),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "أحمد ياسر",
              style: AppTextStyles.bold13.copyWith(
                color: const Color(0xff131F46),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "mail@mail.com",
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
