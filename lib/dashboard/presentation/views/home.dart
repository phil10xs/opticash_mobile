import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opticash_mobile/core/assets/assets.dart';
import 'package:opticash_mobile/core/utils/colors.dart';
import 'package:opticash_mobile/core/utils/string.dart';
import 'package:opticash_mobile/dashboard/presentation/notifier/app_notifier.dart';
import 'package:opticash_mobile/dashboard/presentation/notifier/dash_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );
    return Consumer<DashBaordNotifier>(builder: (context, value, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Image.asset(
                    kUser,
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello ${value.signInResult!.data!.firstName} !" ??
                          'Hello, James!',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: appColor.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      value.signInResult!.data!.userName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: appColor.subTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                    ),
                  ],
                )
              ],
            ),
            actions: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                      child: Text(
                        '1',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: appColor.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.12),
                    child: Image.asset(
                      kTime,
                      width: 18,
                      height: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                      child: Text(
                        '2',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: appColor.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.12),
                    child: Image.asset(
                      kBell,
                      width: 18,
                      height: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18, left: 18),
                    child: Container(
                        color: Colors.transparent, child: Image.asset(kBoard2)),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          margin: EdgeInsets.all(10),
                          height: 25,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: appColor.tertiary,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    kCoin,
                                    height: 18,
                                    width: 18,
                                  ),
                                  Spacer(),
                                  Text(
                                    'Opticash Balance',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: appColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    kDropdown,
                                    height: 15,
                                    width: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$243,998',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: appColor.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '123848492920304.234(OPCH)',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: appColor.secondary2,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Icon(
                          Icons.visibility_off,
                          color: appColor.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: appColor.newGrey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: appColor.secondary,
                                  child: ImageIcon(
                                    AssetImage(
                                      kSendMoney,
                                    ),
                                    color: appColor.white,
                                  ),
                                ),
                                Text(
                                  'Send Money',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: appColor.primary),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: appColor.secondary,
                                  radius: 18,
                                  child: ImageIcon(
                                    AssetImage(kTopUp),
                                    color: appColor.white,
                                  ),
                                ),
                                Text(
                                  'Top-Up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: appColor.primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: appColor.secondary,
                                  child: ImageIcon(
                                      AssetImage(
                                        kAccountDetails,
                                      ),
                                      color: appColor.white),
                                ),
                                Text(
                                  'Account Details',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: appColor.primary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 65, left: 18),
                child: Stack(
                  children: [
                    Image.asset(
                      kActivity,
                      width: double.infinity,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              'Refer a friend\n and earn \$3 per\n referral',
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: appColor.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Today, 26 june 2021
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18),
                child: Row(
                  children: [
                    Text(
                      'Today, 26 June 2021',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: appColor.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18),
                child: Container(
                  padding: const EdgeInsets.only(right: 18, left: 18),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appColor.newGrey,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        kFlag,
                        height: 35,
                        width: 35,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Transfer to James',
                            maxLines: 3,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: appColor.black,
                                ),
                          ),
                          Text(
                            'Pending',
                            maxLines: 3,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: kFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: appColor.black,
                                ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '- N1.890',
                            maxLines: 3,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: appColor.black,
                                ),
                          ),
                          Text(
                            '10th July 2023',
                            maxLines: 3,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: kFont,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w200,
                                  color: appColor.black,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
