import 'package:flutter/material.dart';

import '../../../../core/common/build_main_app_bar.dart';
import 'widgets/account_view_body.dart';

class AccountView extends StatelessWidget {
  static const String routeName = 'account_view';

  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainAppBar(
        context: context,
        title: 'حسابي',
        isLeadingVisible: false,
      ),
      body: const AccountViewBody(),
    );
  }
}
