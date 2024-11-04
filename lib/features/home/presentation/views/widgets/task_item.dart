import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/presentation/views/widgets/bottom_task_item.dart';
import 'package:tasky/features/home/presentation/views/widgets/header_task_item.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Image.asset('assets/images/image 2.png'),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderTaskItem(),
              const SizedBox(
                height: 4,
              ),
              Text(
                'This application is designed for s',
                style: AppTextStyles.styleRegular14.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const BottomTaskItem(),
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.more_vert_rounded,
          ),
        ),
      ],
    );
  }
}
