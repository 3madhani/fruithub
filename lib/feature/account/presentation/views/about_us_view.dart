import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_app_bar.dart';

import 'widgets/about_us_view_body.dart';

class AboutUsView extends StatelessWidget {
  static const routeName = "about-us-view";

  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildAppBar(context: context, title: "من نحن"),
        body: const AboutUsViewBody(),
      ),
    );
  }
}
