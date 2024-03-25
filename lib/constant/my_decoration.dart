import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';

class MyDecoration {
  static BoxDecoration mainGradient = const BoxDecoration(
      gradient: LinearGradient(
          colors: GradientColors.bottomNavBackground,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter));
}
