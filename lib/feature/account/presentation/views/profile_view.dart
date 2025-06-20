import 'package:flutter/material.dart';

import '../../../../core/common/custom_app_bar.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = 'profile_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "حسابي"),
      body: const ProfileViewBody(),
    );
  }
}
