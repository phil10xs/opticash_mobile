import 'package:flutter/material.dart';
import 'package:opticash_mobile/dashboard/presentation/views/home.dart';

// final routes = <String, WidgetBuilder>{
//   LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
//   HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
//   DashBoardScreen.routeName: (BuildContext context) => const DashBoardScreen(),
//   SplashScreen.routeName: (BuildContext context) => const SplashScreen()
// };
Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case LoginScreen.routeName:
    //   // final Map args = settings.arguments as Map;
    //   return MaterialPageRoute(
    //     builder: (_) => const LoginScreen(),
    //     settings: const RouteSettings(name: LoginScreen.routeName),
    //   );

    case HomeScreen.routeName:
      // final Map args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: HomeScreen.routeName),
      );

    // case DashBoardScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const DashBoardScreen(),
    //     settings: const RouteSettings(name: DashBoardScreen.routeName),
    //   );

    default:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: HomeScreen.routeName),
      );
  }
}
