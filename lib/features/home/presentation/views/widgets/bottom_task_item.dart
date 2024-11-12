import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class BottomTaskItem extends StatelessWidget {
  const BottomTaskItem({
    super.key,
    required this.priority,
    required this.date,
    required this.priorityColor,
  });
  final String priority;
  final String date;
  final Color priorityColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(
              Icons.flag_outlined,
              color: priorityColor,
            ),
            Text(
              priority,
              style: AppTextStyles.styleMeduim12.copyWith(
                color: priorityColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          date,
          style: AppTextStyles.styleMeduim12.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
