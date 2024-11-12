import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class HeaderTaskItem extends StatelessWidget {
  const HeaderTaskItem({
    super.key,
    required this.title,
    required this.status,
    required this.statusColor,
  });
  final String title;
  final String status;
  final Color statusColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
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
              status,
              style: AppTextStyles.styleMeduim12.copyWith(
                color: statusColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
