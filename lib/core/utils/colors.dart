import 'package:flutter/material.dart';

final appColor = PoColors();

class PoColors {
  // PoColors();
  static PoColors? _instance;

  factory PoColors() {
    return _instance ??= PoColors._internal();
  }

  PoColors._internal();

  final smallGradient = const LinearGradient(
      begin: Alignment(-0.9449995756149292, -1.0066247582435608),
      end: Alignment(-1.10259151458740234, 0.8449995756149292),
      // stops: [0.1,0.4,0.5],
      colors: [
        Color.fromRGBO(163, 0, 5, 1),
        Color.fromRGBO(47, 46, 52, 1),
      ]);

  final primaryGradient = const LinearGradient(
      begin: Alignment(-0.9449995756149292, -1.0066247582435608),
      end: Alignment(-1.10259151458740234, 0.8449995756149292),
      colors: [
        Color.fromRGBO(163, 0, 5, 1),
        Color.fromRGBO(47, 46, 52, 1),
      ]);

  final secondaryGradient = const LinearGradient(
      begin: Alignment(-0.3, -1),
      end: Alignment(-0.9, 6),
      colors: [
        Color.fromRGBO(163, 0, 5, 1),
        Color.fromRGBO(47, 46, 52, 1),
      ]);
}
