import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/presentation/views/widgets/bottom_task_item.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_popup_menu_button.dart';
import 'package:tasky/features/home/presentation/views/widgets/header_task_item.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(
      {super.key, required this.taskModel, required this.onTap, this.onDelete});
  final TaskModel taskModel;
  final void Function() onTap;
  final void Function(String)? onDelete;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: FileImage(File(taskModel.image!)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderTaskItem(
                  statusColor: taskModel.status == 'waiting'
                      ? AppColors.waitingTextColor
                      : taskModel.status == 'inProgress'
                          ? AppColors.inProgressTextColor
                          : taskModel.status == 'finished'
                              ? AppColors.finishedTextColor
                              : Colors.white,
                  status: taskModel.status!,
                  title: taskModel.title!,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  taskModel.desc!,
                  style: AppTextStyles.styleRegular14.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                BottomTaskItem(
                  priorityColor: taskModel.priority == 'low'
                      ? AppColors.finishedTextColor
                      : taskModel.priority == 'medium'
                          ? AppColors.primaryColor
                          : AppColors.waitingTextColor,
                  priority: taskModel.priority!,
                  date: taskModel.createdAt!.toLocal().toString().split(' ')[0],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          CustomPopupMenuButton(
            onSelected: onDelete,
          )
        ],
      ),
    );
  }
}
