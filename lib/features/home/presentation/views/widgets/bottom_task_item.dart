import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class BottomTaskItem extends StatelessWidget {
  const BottomTaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              Icons.flag_outlined,
              color: AppColors.primaryColor,
            ),
            Text(
              'Medium',
              style: AppTextStyles.styleMeduim12.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          '30/12/2022',
          style: AppTextStyles.styleMeduim12.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
