import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_assets.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: const ShapeDecoration(
        color: Color(0xffEEF8ED),
        shape: OvalBorder(),
      ),
      child: SvgPicture.asset(
        Assets.svgNotification,
        height: 20,
        width: 20,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
