import 'package:flutter/material.dart';
import 'package:fruithub/feature/home/presentation/views/home_view.dart';
import 'package:fruithub/feature/home/presentation/views/product_view.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

import 'cart_shopping_view.dart';

class MainView extends StatefulWidget {
  static const String routeName = 'main_view';

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentViewIndex = 0;

  final List<Widget> _views = const [
    HomeView(),
    ProductView(),
    CartShoppingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentViewIndex, children: _views),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        activeIndex: _currentViewIndex,
        onTap: _onNavBarTap,
      ),
    );
  }

  void _onNavBarTap(int index) {
    if (_currentViewIndex != index) {
      setState(() {
        _currentViewIndex = index;
      });
    }
  }
}
