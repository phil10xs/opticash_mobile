import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:opticash_mobile/core/di-manual/di_manual.dart';
import 'package:opticash_mobile/core/routes/route.dart';
import 'package:opticash_mobile/core/utils/colors.dart';
import 'package:opticash_mobile/core/utils/input_validator.dart';
import 'package:opticash_mobile/core/utils/theme.dart';
import 'package:opticash_mobile/dashboard/presentation/notifier/app_notifier.dart';
import 'package:opticash_mobile/dashboard/presentation/notifier/dash_notifier.dart';
import 'package:opticash_mobile/dashboard/presentation/views/create_account.dart';
import 'package:opticash_mobile/dashboard/presentation/views/splashone.dart';
import 'package:opticash_mobile/dashboard/presentation/widgets/button.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: appColor.white));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<DashBaordNotifier>()),
        ChangeNotifierProvider.value(value: getIt<MyNotifier>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        theme: theme,
        home: const SplashOne(),
      ),
    );
  }
}
