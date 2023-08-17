import 'package:flutter/material.dart';
import 'package:opticash_mobile/core/assets/assets.dart';
import 'package:opticash_mobile/core/utils/colors.dart';
import 'package:opticash_mobile/dashboard/presentation/notifier/app_notifier.dart';
import 'package:opticash_mobile/dashboard/presentation/views/home.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  static const routeName = "/dashboard";
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int? currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _screens = [
      const HomeScreen(),
      const Center(child: Text('')),
      const SizedBox(),
      const Center(child: Text('')),
      const Center(child: Text(''))
    ];

    return Consumer<MyNotifier>(builder: (context, value, child) {
      final _list = [
        SizedBox(
          child: Column(
            children: [
              const SizedBox(height: 35),
              ImageIcon(
                AssetImage(kMore),
                color: value.current == 0 ? appColor.tertiary : Colors.grey,
              ),
              Text(
                'Home',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color:
                          value.current == 0 ? appColor.tertiary : Colors.grey,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              const SizedBox(height: 35),
              ImageIcon(
                AssetImage(kCard),
                color: value.current == 1
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              Text(
                'Card',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: value.current == 1
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      kSend,
                      width: 65,
                      height: 60,
                    ),
                    Text(
                      'Send',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              const SizedBox(height: 35),
              ImageIcon(
                AssetImage(kSwap),
                color: value.current == 3
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              Text(
                'Swap',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: value.current == 3
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              const SizedBox(height: 35),
              ImageIcon(
                AssetImage(kAccount),
                color: value.current == 4
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              Text(
                'Account',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: value.current == 4
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      ];

      return Scaffold(
        body: _screens[value.current],
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          height: 90,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 3,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var i = 0; i < _list.length; i++) ...[
                    GestureDetector(
                      onTap: () {
                        if (i == 2) {}
                        value.current = i;
                        currentIndex = i;
                      },
                      child: _list[i],
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
