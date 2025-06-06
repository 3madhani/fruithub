import 'package:flutter/material.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/Home_view.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

class MainView extends StatelessWidget {
  static const String routeName = 'homeRoute';

  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: HomeView()),
    );
  }
}
