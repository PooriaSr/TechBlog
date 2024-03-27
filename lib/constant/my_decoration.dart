import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';

class MyDecoration {
  MyDecoration._();

  static BoxDecoration mainGradient = BoxDecoration(
      borderRadius: BorderRadius.circular(26),
      gradient: const LinearGradient(
          colors: GradientColors.bottomNav,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight));
}
