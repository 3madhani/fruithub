import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_cubit/cart_cubit.dart';
import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/main_view_body_bloc_consumer.dart';

class MainView extends StatefulWidget {
  static const String routeName = 'main_view';

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CartCubit())],
      child: Scaffold(
        body: SafeArea(
          child: MainViewBodyBlocConsumer(currentViewIndex: _currentViewIndex),
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
