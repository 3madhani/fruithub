import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruithub/feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';

import 'core/cubits/cubit/add_favorite_cubit.dart';
import 'core/helper/on_generate_routes.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/get_it_services.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/utils/app_colors.dart';
import 'feature/account/presentation/manager/theme/theme_cubit.dart';
import 'feature/account/presentation/manager/user_info/user_info_cubit.dart';
import 'feature/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  // Initialize shared preferences
  await Prefs.init();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize GetIt*-
  setupGetIt();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider<AddFavoriteCubit>(
          create: (_) => getIt<AddFavoriteCubit>(),
        ),
        BlocProvider<UserInfoCubit>(
          create: (_) => getIt<UserInfoCubit>()..fetchUserInfo(),
        ),
        BlocProvider<CartCubit>(create: (_) => getIt<CartCubit>()),
      ],
      child: const FruitHub(),
    ),
  );
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder:
          (context, themeMode) => MaterialApp(
            theme: ThemeData(
              fontFamily: 'Cairo',
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
              ),
            ),
            darkTheme: ThemeData.dark().copyWith(
              textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Cairo'),
              scaffoldBackgroundColor: Colors.black,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
              ),
            ),
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar'),
            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashView.routeName,
          ),
    );
  }
}
