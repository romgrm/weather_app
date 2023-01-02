import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  Color getPrimary();

  Color getSecondary();

  Color getThirdly();
}
