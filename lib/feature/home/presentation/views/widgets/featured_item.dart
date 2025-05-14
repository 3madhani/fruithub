import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              right: width * .4,
              child: SvgPicture.asset(Assets.svgImage2, fit: BoxFit.fill),
            ),
            Container(
              padding: const EdgeInsets.only(right: 33),
              width: width * .5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: svg.Svg(Assets.svgFeaturedItemBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    "عروض العيد",
                    style: AppTextStyles.regular13.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "خصم 25%",
                    style: AppTextStyles.bold19.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 11),
                  FeaturedItemButton(onPressed: () {}),
                  const SizedBox(height: 29),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
