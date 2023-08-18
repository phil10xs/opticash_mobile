import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opticash_mobile/core/assets/assets.dart';
import 'package:opticash_mobile/core/utils/colors.dart';
import 'package:opticash_mobile/dashboard/presentation/views/create_account.dart';
import 'package:opticash_mobile/dashboard/presentation/views/login.dart';
import 'package:opticash_mobile/dashboard/presentation/widgets/button.dart';

class Onboard extends StatefulWidget {
  static const routeName = '/onboard';
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          kOnboard,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Send Money faster than imagined',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Opticash provides you the fastest remittance to send and receive money!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 2.5,
                        color: appColor.secondary,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 60,
                        height: 2.5,
                        color: appColor.secondary,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 60,
                        height: 2.5,
                        color: appColor.white,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  PrimaryButton(
                    useGradient: true,
                    color: appColor.secondary,
                    title: Text(
                      'Create New Account',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    onLogin: () {
                      SystemChrome.setSystemUIOverlayStyle(
                        SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                        ),
                      );
                      Navigator.of(context).pushNamed(CreateAccount.routeName);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      SystemChrome.setSystemUIOverlayStyle(
                        SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                        ),
                      );
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
