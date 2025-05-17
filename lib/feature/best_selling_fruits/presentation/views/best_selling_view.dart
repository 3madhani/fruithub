import 'package:flutter/material.dart';

import '../../../../core/common/build_main_app_bar.dart';
import 'widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  static const String routeName = 'best-selling';

  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainAppBar(context: context, title: 'الأكثر مبيعًا'),
      body: const BestSellingViewBody(),
    );
  }
}
