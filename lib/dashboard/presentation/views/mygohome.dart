import 'package:flutter/material.dart';

class MyGoHome extends StatefulWidget {
  const MyGoHome({Key? key}) : super(key: key);

  @override
  State<MyGoHome> createState() => _MyGoHomeState();
}

class _MyGoHomeState extends State<MyGoHome> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('myGo'));
  }
}
