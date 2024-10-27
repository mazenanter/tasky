import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class CustomBodyTexts extends StatelessWidget {
  const CustomBodyTexts({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Task Management &',
          style: AppTextStyles.styleBold24,
        ),
        const Text(
          'To-Do List',
          style: AppTextStyles.styleBold24,
        ),
        SizedBox(
          height: height * 0.016,
        ),
        const Text(
          'This productive tool is designed to help',
          style: AppTextStyles.styleRegular14,
        ),
        const Text(
          'you better manage your task ',
          style: AppTextStyles.styleRegular14,
        ),
        const Text(
          'project-wise conveniently!',
          style: AppTextStyles.styleRegular14,
        ),
      ],
    );
  }
}
