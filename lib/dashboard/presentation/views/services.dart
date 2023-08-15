import 'package:flutter/material.dart';

class ServicesView extends StatefulWidget {
  static const route = '/services';
  const ServicesView({Key? key}) : super(key: key);

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return const Center(
      child: Text('SERVICES'),
    );
  }
}
