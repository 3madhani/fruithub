import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_cubit/cart_cubit.dart';
import 'cart_view.dart';
import 'home_view.dart';
import 'products_view.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class MainView extends StatefulWidget {
  static const String routeName = 'main_view';

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentViewIndex = 0;

  final List<Widget> _views = const [HomeView(), ProductsView(), CartView()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: SafeArea(
          child: IndexedStack(index: _currentViewIndex, children: _views),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          activeIndex: _currentViewIndex,
          onTap: _onNavBarTap,
        ),
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
