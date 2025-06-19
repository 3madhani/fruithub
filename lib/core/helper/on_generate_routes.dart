import 'package:flutter/material.dart';

import '../../feature/account/presentation/views/account_view.dart';
import '../../feature/account/presentation/views/orders_view.dart';
import '../../feature/auth/presentation/views/sign_up_view.dart';
import '../../feature/auth/presentation/views/signin_view.dart';
import '../../feature/best_selling_fruits/presentation/views/best_selling_view.dart';
import '../../feature/checkout/presentation/views/checkout_view.dart';
import '../../feature/home/domain/entities/cart_entity.dart';
import '../../feature/home/presentation/views/main_view.dart';
import '../../feature/onboarding/presentation/views/onboarding_view.dart';
import '../../feature/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case AccountView.routeName:
      return MaterialPageRoute(builder: (_) => const AccountView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (_) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());
    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => CheckoutView(cartEntity: settings.arguments as CartEntity),
      );
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (_) => const OrdersView());
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
