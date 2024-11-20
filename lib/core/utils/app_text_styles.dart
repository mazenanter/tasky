import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle styleBold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle styleBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle styleBold19 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle styleBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle styleBold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle styleRegular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textGreyColor,
  );
  static const TextStyle styleMeduim12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle styleMeduim19 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle styleMeduim16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xffFF7D53),
  );
}
