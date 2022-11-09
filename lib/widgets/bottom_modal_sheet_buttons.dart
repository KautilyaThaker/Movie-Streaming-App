import 'package:flutter/material.dart';

class BottomSheetButtons extends StatefulWidget {
  const BottomSheetButtons(
      {Key? key,
      required this.label,
      required this.backgroundColor,
      required this.labelColor,
      required this.onTap})
      : super(key: key);
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final void Function() onTap;

  @override
  State<BottomSheetButtons> createState() => _BottomSheetButtonsState();
}

class _BottomSheetButtonsState extends State<BottomSheetButtons> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 24.0,
          ),
          margin: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: widget.labelColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
