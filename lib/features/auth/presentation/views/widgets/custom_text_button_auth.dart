import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class CustomTextButtonAuth extends StatelessWidget {
  const CustomTextButtonAuth({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Didn’t have any account?',
          style: AppTextStyles.styleRegular14,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Sign Up here',
            style: AppTextStyles.styleBold14.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
