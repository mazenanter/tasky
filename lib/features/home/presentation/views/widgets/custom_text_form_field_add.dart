import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class CustomTextFromFieldAdd extends StatelessWidget {
  const CustomTextFromFieldAdd({
    super.key,
    this.maxLength,
    required this.title,
    this.sufIcon,
  });
  final int? maxLength;
  final String title;
  final IconData? sufIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLength,
      decoration: InputDecoration(
        suffixIcon: Icon(
          sufIcon,
          color: AppColors.primaryColor,
        ),
        hintText: title,
        hintStyle: AppTextStyles.styleRegular14.copyWith(
          color: const Color(0xff6E6A7C),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0.5,
              color: Color(0xff6E6A7C),
            )),
      ),
    );
  }
}