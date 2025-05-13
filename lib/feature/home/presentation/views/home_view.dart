import 'package:flutter/material.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'homeRoute';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: HomeViewBody()));
  }
}
