import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_app_bar.dart';

import 'widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  static const routeName = 'favorite_view';

  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "المفضلة"),
      body: const FavoriteViewBody(),
    );
  }
}
