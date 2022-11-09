import 'package:flutter/material.dart';

class PremimumProvider extends ChangeNotifier{
  String? amount;

  void getPack(String cost) {
    amount = cost;
  }

}