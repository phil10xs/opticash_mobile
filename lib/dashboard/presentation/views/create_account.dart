import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:opticash_mobile/core/utils/colors.dart';
import 'package:opticash_mobile/core/utils/input_validator.dart';
import 'package:opticash_mobile/dashboard/data/model/accountmodel.dart';
import 'package:opticash_mobile/dashboard/presentation/notifier/dash_notifier.dart';
import 'package:opticash_mobile/dashboard/presentation/views/login.dart';
import 'package:opticash_mobile/dashboard/presentation/widgets/button.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  static const routeName = '/create_Account';
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var showPassword = false;

  void _incrementCounter() async {
    var dash = context.read<DashBaordNotifier>();

    dash.signUp(context, param: dash.credentials);
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );
    var dash = context.read<DashBaordNotifier>();
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
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    "assets/pngs/back.png",
                    width: 34,
                    height: 34,
                    color: appColor.primary,
                  ),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  onChanged: (value) {
                    dash.updateCredential("first_name", value);
                  },
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
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  onChanged: (value) {
                    dash.updateCredential("last_name", value);
                  },
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
                    hintText: 'Robert',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  style: Theme.of(context).textTheme.bodySmall,
                  onChanged: (value) {
                    dash.updateCredential("email", value);
                  },
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
                  obscureText: !showPassword,
                  obscuringCharacter: '●',
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  onChanged: (value) {
                    dash.updateCredential("password", value);
                  },
                  style: showPassword
                      ? Theme.of(context).textTheme.bodySmall
                      : Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: appColor.black),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                        color: appColor.black,
                      ),
                    ),
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
                    hintText: "Password",
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                  child: Column(
                    children: [],
                  ),
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            InkWell(
                              onTap: () => {
                                Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName)
                              },
                              child: Text(
                                "Sign In",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: appColor.primary),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PrimaryButton(
                          color: appColor.black,
                          title: Text(
                            'Create New Account'.toUpperCase(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          onLogin: () {
                            _incrementCounter();
                            // Navigator.of(context).pushNamed(
                            //   LoginScreen.routeName,
                            // );
                          },
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
