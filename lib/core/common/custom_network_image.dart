import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;

  const CustomNetworkImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder:
          (context, url) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
              strokeWidth: 2,
            ),
          ),
      height: 120,
      imageUrl: imageUrl,
      imageBuilder:
          (context, imageProvider) => Container(
            height: 120,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
            ),
          ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
