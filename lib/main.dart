import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:opticash_mobile/core/di-manual/di_manual.dart';
import 'package:opticash_mobile/core/utils/colors.dart';
import 'package:opticash_mobile/core/utils/input_validator.dart';
import 'package:opticash_mobile/core/utils/theme.dart';
import 'package:opticash_mobile/dashboard/presentation/notifier/dash_notifier.dart';
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
      ],
      child: MaterialApp(
        theme: theme,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });

    var response = await context.read<DashBaordNotifier>().signUp(param: {
      "first_name": "Phil",
      "last_name": "Katage",
      "email": "phil20xs@yopmail.com",
      "password": "Qwerty1234@@"
    });
    log("ftest ${response.message}");
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/pngs/back.png",
                  width: 34,
                  height: 34,
                  color: appColor.primary,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Register a new account using your email address and fill in your informations',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // controller: r,

                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: InputValidator. (
                  //     message: "Email Address or Username must not be empty"),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    floatingLabelStyle:
                        Theme.of(context).textTheme.headlineMedium,
                    labelText: "First Name",
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    contentPadding: const EdgeInsets.only(
                      top: 14.0,
                      bottom: 12.0,
                      left: 25.0,
                      right: 14.0,
                    ),
                    border: myfocusborder(),
                    focusedBorder: myfocusborder(),
                    enabledBorder: myfocusborder(),
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: 'James Robert',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // controller: r,

                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: InputValidator. (
                  //     message: "Email Address or Username must not be empty"),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    floatingLabelStyle:
                        Theme.of(context).textTheme.headlineMedium,
                    labelText: "Last Name",
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    contentPadding: const EdgeInsets.only(
                      top: 14.0,
                      bottom: 12.0,
                      left: 25.0,
                      right: 14.0,
                    ),
                    border: myfocusborder(),
                    focusedBorder: myfocusborder(),
                    enabledBorder: myfocusborder(),
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: 'James Robert',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // controller: r,

                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: InputValidator. (
                  //     message: "Email Address or Username must not be empty"),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    floatingLabelStyle:
                        Theme.of(context).textTheme.headlineMedium,
                    labelText: "Email",
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    contentPadding: const EdgeInsets.only(
                      top: 14.0,
                      bottom: 12.0,
                      left: 25.0,
                      right: 14.0,
                    ),
                    border: myfocusborder(),
                    focusedBorder: myfocusborder(),
                    enabledBorder: myfocusborder(),
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: 'Email',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // controller: r,

                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: InputValidator. (
                  //     message: "Email Address or Username must not be empty"),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    floatingLabelStyle:
                        Theme.of(context).textTheme.headlineMedium,
                    labelText: "Password",
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    contentPadding: const EdgeInsets.only(
                      top: 14.0,
                      bottom: 12.0,
                      left: 25.0,
                      right: 14.0,
                    ),
                    border: myfocusborder(),
                    focusedBorder: myfocusborder(),
                    enabledBorder: myfocusborder(),
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: 'James Robert',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Column(
                    children: [
                      Text(
                        "Already have an account? ",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                "Sign In",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: appColor.primary),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PrimaryButton(
                            title: Text('Create New Account'.toUpperCase(),
                                style: Theme.of(context).textTheme.bodyMedium),
                            onLogin: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Text(
                        "By signing up you agree to our ",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Term of use ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: appColor.primary,
                                  )),
                          Text(
                            "and ",
                            style: Theme.of(context).textTheme.headlineMedium!,
                          ),
                          Text(
                            "Privacy Policy",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: appColor.primary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ));
  }
}
