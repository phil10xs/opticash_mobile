import 'dart:developer';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: null,
          onPressed: () async {
            Map<String, dynamic> loginCred = {
              'device_Id':
                  '8f8d0298ea7b9093b97d8588cb65321af89d29da83b142855d2c7ef996c3a5a3',
              'is_biometric': false,
            };

            log('data ${loginCred}');
            // context.mynotifier.loginCredentials = loginCred;
            // var res = await context.mynotifier.loginToDashBoard();
            // res.fold((l) {
            //   log('data here ${l.message}');
            // }, (r) {
            //   log('data herefailed $r');
            // });
          },
          child: const Text('Test Navigation'),
        ),
      ),
    );
  }
}
