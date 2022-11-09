// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:movie_app/constants.dart';
//
// import '../../../database.dart';
// import '../../bottom_modal_sheet_buttons.dart';
// import '../../bottom_modal_sheet_heading.dart';
// import 'custom_percentage_indicator.dart';
//
// class RatingBottomSheet extends StatefulWidget {
//   const RatingBottomSheet({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   State<RatingBottomSheet> createState() => _RatingBottomSheetState();
// }
//
// class _RatingBottomSheetState extends State<RatingBottomSheet> {
//   late String rating;
//   int raters = 150701;
//
//   @override
//   void initState() {
//     getInfo();
//     super.initState();
//   }
//
//   // Method to retrieve information of details to show here
//   void getInfo() {
//     // TODO: Search for info of rating from database
//     for (var element in movies) {
//       if (element['title'] == widget.title) {
//         rating = element['rating']!;
//         break;
//       }
//     }
//     for (var element in shows) {
//       if (element['title'] == widget.title) {
//         rating = element['rating']!;
//         break;
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () {
//         Navigator.pop(context);
//       },
//       child: GestureDetector(
//         onTap: () {},
//         child: DraggableScrollableSheet(
//           initialChildSize: 0.52,
//           maxChildSize: 0.9,
//           minChildSize: 0.3,
//           builder: (_, controller) => Container(
//             padding: const EdgeInsets.all(8.0),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(32.0),
//                 topRight: Radius.circular(32.0),
//               ),
//             ),
//             child: ListView(
//               children: [
//                 /// Heading
//                 const CustomHeading(heading: 'Give Rating'),
//
//                 /// Row for displaying rating and percentage bars
//                 Container(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       /// Column for rating fraction, rating percentage stars, number of people who rated
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           /// Rating Fraction
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.baseline,
//                             textBaseline: TextBaseline.alphabetic,
//                             children: [
//                               Text(
//                                 rating,
//                                 style: kRatingPopUpNumericRatingTextStyle,
//                               ),
//                               const Text(
//                                 '/10',
//                                 style: TextStyle(
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.grey,
//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(height: 8.0),
//
//                           /// Rating percentage stars
//                           RatingBarIndicator(
//                             rating: double.parse(rating) / 2,
//                             itemBuilder: (context, index) => const Icon(
//                               IconlyBold.star,
//                               color: kAppThemeRed,
//                             ),
//                             itemCount: 5,
//                             itemSize: 18,
//                             unratedColor: kAppThemeRedLight,
//                             direction: Axis.horizontal,
//                           ),
//                           const SizedBox(height: 8.0),
//
//                           /// Number of user who rated
//                           Text(
//                             '($raters users)',
//                             style: const TextStyle(
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black,
//                             ),
//                           )
//                         ],
//                       ),
//
//                       /// Vertical Divider
//                       Container(
//                         height: 100.0,
//                         width: 1.0,
//                         color: Colors.grey[300],
//                         margin: const EdgeInsets.symmetric(horizontal: 16.0),
//                       ),
//
//                       /// Rating percentage bars
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           /// 5
//                           CustomPercentageIndicator(
//                             percentage: 0.93,
//                             leadingLabel: '5',
//                           ),
//
//                           /// 4
//                           CustomPercentageIndicator(
//                             percentage: 0.82,
//                             leadingLabel: '4',
//                           ),
//
//                           /// 3
//                           CustomPercentageIndicator(
//                             percentage: 0.4,
//                             leadingLabel: '3',
//                           ),
//
//                           /// 2
//                           CustomPercentageIndicator(
//                             percentage: 0.23,
//                             leadingLabel: '2',
//                           ),
//
//                           /// 1
//                           CustomPercentageIndicator(
//                             percentage: 0.06,
//                             leadingLabel: '2',
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 /// Horizontal Divider
//                 Center(
//                   child: Container(
//                     height: 1,
//                     width: 325.0,
//                     margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(100.0),
//                     ),
//                   ),
//                 ),
//
//                 /// Rating Stars
//                 Container(
//                   margin: const EdgeInsets.only(top: 16.0, bottom: 24.0),
//                   child: Center(
//                     child: RatingBar.builder(
//                       initialRating: 0,
//                       minRating: 0.5,
//                       direction: Axis.horizontal,
//                       allowHalfRating: true,
//                       itemCount: 5,
//                       unratedColor: kAppThemeRedLight,
//                       itemSize: 50,
//                       itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                       itemBuilder: (context, _) => const Icon(
//                         IconlyBold.star,
//                         color: kAppThemeRed,
//                       ),
//                       onRatingUpdate: (rating) {
//                         print(rating);
//                       },
//                     ),
//                   ),
//                 ),
//
//                 /// Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     /// Reset
//                     BottomSheetButtons(
//                       label: 'Cancel',
//                       backgroundColor: kAppThemeRedLight,
//                       labelColor: kAppThemeRed,
//                       onTap: () {
//                         // TODO: Cancel Event
//                       },
//                     ),
//
//                     /// Apply
//                     BottomSheetButtons(
//                       label: 'Save',
//                       backgroundColor: kAppThemeRed,
//                       labelColor: Colors.white,
//                       onTap: () {
//                         // TODO: Save event trigger
//                       },
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
