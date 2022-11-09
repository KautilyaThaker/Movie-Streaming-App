// import 'package:flutter/material.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
//
// import '../../../constants.dart';
//
// class CustomPercentageIndicator extends StatefulWidget {
//   const CustomPercentageIndicator(
//       {Key? key, required this.percentage, required this.leadingLabel})
//       : super(key: key);
//   final double percentage;
//   final String leadingLabel;
//
//   @override
//   State<CustomPercentageIndicator> createState() =>
//       _CustomPercentageIndicatorState();
// }
//
// class _CustomPercentageIndicatorState extends State<CustomPercentageIndicator> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: LinearPercentIndicator(
//         progressColor: kAppThemeRed,
//         backgroundColor: kAppThemeRedLight,
//         barRadius: const Radius.circular(100.0),
//         percent: widget.percentage,
//         width: width * 0.5,
//         leading: Text(
//           widget.leadingLabel,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
