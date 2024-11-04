import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class HeaderTaskItem extends StatelessWidget {
  const HeaderTaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Grocery Shopping A',
            maxLines: 1,
            style: AppTextStyles.styleBold16,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.waitingColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              'Waiting',
              style: AppTextStyles.styleMeduim12.copyWith(
                color: AppColors.waitingTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
