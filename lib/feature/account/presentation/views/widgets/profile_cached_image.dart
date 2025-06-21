import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../core/utils/app_assets.dart';

class ProfileCachedImage extends StatelessWidget {
  final String imageUrl;

  const ProfileCachedImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      elevation: 3,
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[800]
                  : Colors.grey[200],
        ),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          placeholder:
              (context, url) => const Center(
                child: SpinKitFadingCircle(color: Colors.grey, size: 30),
              ),
          errorWidget: (context, url, error) => _errorImageProfile(),
        ),
      ),
    );
  }

  Widget _errorImageProfile() {
    return Image.asset(Assets.imagesProfileImage, fit: BoxFit.contain);
  }
}
