import 'package:flutter/material.dart';
import 'package:opticash_mobile/dashboard/presentation/views/create_account.dart';
import 'package:opticash_mobile/dashboard/presentation/views/dashboard.dart';
import 'package:opticash_mobile/dashboard/presentation/views/login.dart';
import 'package:opticash_mobile/dashboard/presentation/views/onboard.dart';

// final routes = <String, WidgetBuilder>{
//   LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
//   HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
//   DashBoardScreen.routeName: (BuildContext context) => const DashBoardScreen(),
//   SplashScreen.routeName: (BuildContext context) => const SplashScreen()
// };
Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      // final Map args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
        settings: const RouteSettings(name: LoginScreen.routeName),
      );

    case Onboard.routeName:
      return MaterialPageRoute(
        builder: (_) => const Onboard(),
        settings: const RouteSettings(name: Onboard.routeName),
      );

    case DashBoardScreen.routeName:
      // final Map args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) => const DashBoardScreen(),
        settings: const RouteSettings(name: DashBoardScreen.routeName),
      );

    case CreateAccount.routeName:
      return MaterialPageRoute(
        builder: (_) => const CreateAccount(),
        settings: const RouteSettings(name: CreateAccount.routeName),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const CreateAccount(),
        settings: const RouteSettings(name: CreateAccount.routeName),
      );
  }
}
