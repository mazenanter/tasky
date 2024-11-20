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
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'https://img.freepik.com/free-vector/focus-abstract-concept_335657-3014.jpg?t=st=1732049147~exp=1732052747~hmac=a6cf5a06cac570775234e9a006ed302af5c9c95425bdb149b50890932ace5a53&w=740',
              ),
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
