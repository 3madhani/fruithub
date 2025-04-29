import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItem extends StatelessWidget {
  final String subTitle, backgroundImage, image;
  final Widget title;
  const PageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.backgroundImage,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, right: 24),
                child: Text(
                  'تخط',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff949D9E),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 13,
              color: const Color(0xff0C0D0D),
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
