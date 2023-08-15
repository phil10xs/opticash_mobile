// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';


// const accounts = [
//   TmpAccount(
//     accountType: "Savings",
//     balance: "2675666",
//     accountNumber: "1024578963",
//   ),
//   TmpAccount(
//     accountType: "Current",
//     balance: "100000",
//     accountNumber: "1234567890",
//   ),
//   TmpAccount(
//     accountType: "Select Plus",
//     balance: "1000000",
//     accountNumber: "1234567890",
//   ),
// ];

// class HomePageView extends StatefulWidget {
//   const HomePageView({
//     super.key,
//   });

//   @override
//   State<HomePageView> createState() => _HomePageViewState();
// }

// class _HomePageViewState extends State<HomePageView> {
//   @override
//   void initState() {
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<DashBaordNotifier>().getAccounts();
//       context.read<DashBaordNotifier>().getUserDetails();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     const featureCardHeight = 110.0;
//     return Column(
//       children: [
//         const SizedBox(height: 18),
//         const _TopSection(),
//         Expanded(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 8),

//                 ///FeatureHighlight Carousel
//                 VulteCardCarousel(
//                   items: [
//                     const PendingCard(),
//                     const PendingCard2(),
//                     const LoanCard(),
//                   ]
//                       .map((e) => Padding(
//                             padding: const EdgeInsets.only(bottom: 15),
//                             child: e,
//                           ))
//                       .toList(),
//                   height: featureCardHeight,
//                   indicatorTopPosition: featureCardHeight - 10,
//                 ),

//                 // const SizedBox(height: 8),

//                 ///Favorite
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: Dims.pageSidePad,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text("Favourites",
//                           textAlign: TextAlign.start,
//                           style: context.theme.textTheme.titleLarge
//                               ?.copyWith(color: appColor.black)),
//                       const Spacer(),
//                       InkWell(
//                           onTap: () {
//                             log("pressed");
//                           },
//                           borderRadius: BorderRadius.circular(5),
//                           splashColor: appColor.white.withOpacity(0.3),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 right: Dims.pageSidePad,
//                                 left: Dims.pageSidePad * 2,
//                                 top: 8.0),
//                             child: SvgPicture.asset(kEditFavoriteIcon),
//                           ))
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Container(
//                   height: 67,
//                   // color: appColor.purple,
//                   margin: const EdgeInsets.only(left: Dims.pageSidePad + 4),
//                   child: Row(
//                     children: [
//                       FavoriteItem(
//                           title: "Add favorite", icon: kAddFavoriteIcon),
//                       FavoriteItem(title: "Transport", icon: kTransportIcon),
//                       FavoriteItem(title: "Fashion", icon: kFashionIcon),
//                       FavoriteItem(title: "Data bundle", icon: kDataIcon),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 ///Services
//                 WidgetTitle(
//                   title: const Padding(
//                     padding: EdgeInsets.only(left: Dims.pageSidePad),
//                     child: Text("Services", textAlign: TextAlign.start),
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     margin: const EdgeInsets.only(left: Dims.pageSidePad),
//                     child: Wrap(
//                       runSpacing: 6,
//                       children: [
//                         ServiceItem(
//                           title: "Delivery",
//                           icon: kCartIcon,
//                         ),
//                         ServiceItem(
//                           title: "Flight",
//                           icon: kFlightIcon,
//                         ),
//                         ServiceItem(
//                           title: "Airtime",
//                           icon: kAirtimeIcon,
//                         ),
//                         ServiceItem(
//                           title: "Data",
//                           icon: kDataIcon,
//                         ),
//                         ServiceItem(
//                           title: "Bills",
//                           icon: kBillsIcon,
//                         ),
//                         ServiceItem(
//                           title: "Rewards",
//                           icon: kActionGift,
//                         ),
//                         ServiceItem(
//                           title: "Transfer",
//                           icon: kTransferBold,
//                         ),
//                         ServiceItem(
//                           title: "More",
//                           icon: kMore,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 ///promo Carousel
//                 WidgetTitle(
//                   title: const Padding(
//                     padding: EdgeInsets.only(left: Dims.pageSidePad, top: 18),
//                     child: Text("Deals", textAlign: TextAlign.start),
//                   ),
//                   child: VulteCardCarousel(
//                     height: 170,
//                     indicatorTopPosition: 10,
//                     indicatorLeftPosition: 16,
//                     indicatorHeight: 3,
//                     indicatorWidth: 54,
//                     indicatorColor: appColor.yellow,
//                     autoPlay: true,
//                     items: const [
//                       LoanDealCard(),
//                       LoanDealCard(),
//                       LoanDealCard(),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 120),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// class _TopSection extends StatefulWidget {
//   const _TopSection({
//     super.key,
//   });

//   @override
//   State<_TopSection> createState() => _TopSectionState();
// }

// class _TopSectionState extends State<_TopSection> {
//   @override
//   Widget build(BuildContext context) {
//     const double dealHeight = 200;
//     return Padding(
//       padding: const EdgeInsets.only(top: 40),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: Dims.pageSidePad),
//             child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               SvgPicture.asset(
//                 kVulteLogo,
//                 width: 46,
//                 height: 38,
//               ),
//               const Spacer(),
//               const _GreetingWidget(),
//               const Spacer(),
//               RoundIconButton(
//                 iconSvg: kActionGift,
//               ),
//               RoundIconButton(
//                 iconSvg: kActionNotification,
//               ),
//               const SizedBox(width: 16),
//             ]),
//           ),
//           const SizedBox(height: 8),
//           //Accounts Carousel
//           const _AccountCarousel(),
//         ],
//       ),
//     );
//   }
// }

// class _AccountCarousel extends StatelessWidget {
//   const _AccountCarousel({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var watchNotify = context.watch<DashBaordNotifier>();
//     if (watchNotify.accountsResult != null) {
//       return VulteCardCarousel(
//         items: watchNotify.accountsResult?.data
//             ?.map((item) => AccountCard(item))
//             .toList() ??
//             [],
//         indicatorColor: appColor.yellow,
//       );
//     }
//     if (watchNotify.status.isAccount) {
//       if (watchNotify.progress.isLoading) {
//         return SizedBox(
//           height: 150,
//           child: Center(
//             child: WidgetLoading(
//               subtitle: Text(
//                 "Fetching Accounts...",
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//             ),
//           ),
//         );
//       } else if (watchNotify.progress.isError) {
//         return Center(
//           child: Text(
//             watchNotify.error ?? '',
//             style: context.theme.textTheme.titleSmall
//                 ?.copyWith(color: appColor.formError),
//           ),
//         );
//       }
//     }

//       return SizedBox();
//   }
// }

// class _GreetingWidget extends StatelessWidget {
//   const _GreetingWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       "Hi, ${context.watch<DashBaordNotifier>().userResult?.data?.firstname ?? ''}.",
//       style: context.theme.textTheme.bodyLarge?.copyWith(color: appColor.black),
//     );
//   }
// }
