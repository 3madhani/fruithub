import 'package:flutter/material.dart';

import '../cart_view.dart';
import '../home_view.dart';
import '../products_view.dart';

class MainViewBody extends StatelessWidget {
  final int currentViewIndex;

  const MainViewBody({super.key, required this.currentViewIndex});

  @override
  Widget build(BuildContext context) {
    final List<Widget> views = const [HomeView(), ProductsView(), CartView()];
    return IndexedStack(index: currentViewIndex, children: views);
  }
}
