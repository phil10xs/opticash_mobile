import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opticash_mobile/core/utils/colors.dart';
import 'package:opticash_mobile/dashboard/presentation/views/dashboard.dart';
import 'package:opticash_mobile/dashboard/presentation/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var showPassword = false;
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
                  'Sign In',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Sign In to your account using your email address and password',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 25,
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
                    hintText: 'James@opticash.io',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: !showPassword,
                  obscuringCharacter: '●',

                  // controller: r,

                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: InputValidator. (
                  //     message: "Email Address or Username must not be empty"),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
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
                    hintText: 'James Robert',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Forgot Password?  ",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have account?",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              " Create Account ",
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
                          title: Text(
                            'Sign in'.toUpperCase(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          onLogin: () {
                            Navigator.of(context).pushNamed(
                              DashBoardScreen.routeName,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
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
