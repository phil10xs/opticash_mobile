
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// import '../notifier/data.dart';
// import 'home_page.dart';

// List<BottomNavModel> sections = [
//   BottomNavModel(
//     label: 'Home',
//     icon: kNavHome,
//     iconActive: kNavHomeActive,
//     tooltip: 'Home',
//     views: const HomePageView(),
//   ),
//   BottomNavModel(
//     label: 'Transfer',
//     icon: kNavTransfer,
//     iconActive: kNavTransferActive,
//     tooltip: 'Transfer',
//     views: Container(),
//   ),
//   BottomNavModel(
//     label: 'Loan',
//     icon: kNavLoan,
//     iconActive: kNavLoanActive,
//     tooltip: 'Loan',
//     views: Container(),
//   ),
//   BottomNavModel(
//     label: 'History',
//     icon: kNavHistory,
//     iconActive: kNavHistoryActive,
//     tooltip: 'History',
//     views: Container(),
//   ),
//   BottomNavModel(
//     label: 'Menu',
//     icon: kNavMenu,
//     iconActive: kNavMenuActive,
//     tooltip: 'Menu',
//     views: Container(),
//   ),
// ];

// class DashBoardScreen extends StatefulWidget {
//   static const routeName = "/dashboard";

//   const DashBoardScreen({Key? key}) : super(key: key);

//   @override
//   State<DashBoardScreen> createState() => _DashBoardScreenState();
// }

// class _DashBoardScreenState extends State<DashBoardScreen> {
//   int? currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//         statusBarColor: appColor.transparent,
//         statusBarIconBrightness: Brightness.dark));
//     return Scaffold(
//       backgroundColor: appColor.background1.withOpacity(0.94),
//       body: Container(
//         // color: appColor.blue,
//         child: Stack(
//           children: [
//             const _PageBody(),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 height: 115,
//                 color: appColor.transparent,
//                 child: CustomPaint(
//                   // size: const Size(double.infinity, 115),
//                   painter: InwardArcPainter(),
//                   // child: _BottomAppBar(),
//                   child: const BottomBar(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       // bottomNavigationBar: Container(
//       //   // height: 115,
//       //   color: appColor.transparent,
//       //   child: CustomPaint(
//       //     painter: InwardArcPainter(),
//       //     child: const BottomBar(),
//       //   ),
//       // ),
//     );
//   }
// }

// class _PageBody extends StatelessWidget {
//   const _PageBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DashBaordNotifier>(builder: (_, value, __) {
//       return IndexedStack(
//         index: value.section,
//         children: sections.map((e) => e.views ?? const SizedBox()).toList(),
//       );
//     });
//   }
// }

// class _BottomAppBar extends StatelessWidget {
//   const _BottomAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DashBaordNotifier>(builder: (_, value, __) {
//       return BottomAppBar(
//         color: appColor.transparent,
//         elevation: 0,
//         // shape: BottomAppBarShape(),
//         child: DefaultTabController(
//             initialIndex: value.section,
//             length: 5,
//             child: TabBar(
//               padding: EdgeInsets.zero,
//               indicatorSize: TabBarIndicatorSize.tab,
//               indicatorPadding: EdgeInsets.zero,
//               indicatorWeight: 1,
//               tabs: sections.map((e) {
//                 if (sections[value.section].label == e.label) {
//                   ///isSelect
//                   return Tab(
//                     height: 100,
//                     child: Container(
//                       width: 155,
//                       height: 155,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: true ? appColor.primary : Colors.grey,
//                           boxShadow: [
//                             BoxShadow(
//                                 spreadRadius: 3,
//                                 offset: const Offset(0, 3),
//                                 blurRadius: 8,
//                                 color: appColor.black.withOpacity(0.4))
//                           ]),
//                       padding: const EdgeInsets.all(15),
//                       child: SvgPicture.asset(
//                         e.iconActive!,
//                         color: appColor.white,
//                         // width: 24,
//                         // height: 24,
//                       ),
//                     ),
//                   );
//                 }
//                 return Tab(
//                   text: 'Home',
//                   icon: Icon(Icons.home),
//                 );
//               }).toList(),
//             )),
//       );
//     });
//   }
// }
