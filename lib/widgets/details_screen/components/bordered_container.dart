import 'package:flutter/material.dart';

import '../../../constants.dart';

class BorderedContainer extends StatefulWidget {
  const BorderedContainer({Key? key, required this.content}) : super(key: key);
  final String content;

  @override
  State<BorderedContainer> createState() => _BorderedContainerState();
}

class _BorderedContainerState extends State<BorderedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          width: 1.5,
          color: kAppThemeRed,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          widget.content,
          style: const TextStyle(
            fontSize: 12.0,
            color: kAppThemeRed,
          ),
        ),
      ),
    );
  }
}
