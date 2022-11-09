import 'package:flutter/material.dart';

import '../constants.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({Key? key, required this.heading}) : super(key: key);
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Grey Bar
        Container(
          height: 4,
          width: 50.0,
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),

        /// Title
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            heading,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: kAppThemeRed,
            ),
          ),
        ),

        /// Divider
        Container(
          height: 1,
          width: 325.0,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ],
    );
  }
}
