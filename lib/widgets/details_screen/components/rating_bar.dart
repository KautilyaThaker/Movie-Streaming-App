// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// import '../../../constants.dart';
//
// class RatingIndicator extends StatefulWidget {
//   const RatingIndicator({Key? key, required this.rating, required this.onTap})
//       : super(key: key);
//   final String rating;
//   final void Function() onTap;
//
//   @override
//   State<RatingIndicator> createState() => _RatingIndicatorState();
// }
//
// class _RatingIndicatorState extends State<RatingIndicator> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           /// Rating indicator
//           RatingBarIndicator(
//             rating: double.parse(widget.rating) / 10,
//             itemBuilder: (context, index) => const Icon(
//               IconlyBold.star,
//               color: kAppThemeRed,
//             ),
//             itemCount: 1,
//             itemSize: 20,
//             unratedColor: kAppThemeRedLight,
//             direction: Axis.horizontal,
//           ),
//           const SizedBox(width: 8.0),
//
//           /// Rating
//           Text(
//             widget.rating,
//             style: const TextStyle(
//                 fontSize: 15.0,
//                 fontWeight: FontWeight.bold,
//                 color: kAppThemeRed),
//           ),
//           const SizedBox(width: 6.0),
//
//           /// Expand Button
//           const Icon(
//             IconlyLight.arrowRight2,
//             size: 18.0,
//             color: kAppThemeRed,
//           )
//         ],
//       ),
//     );
//   }
// }
