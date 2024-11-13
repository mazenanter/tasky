import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/presentation/views/widgets/info_item_widget.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.file(
          height: 225,
          width: double.infinity,
          fit: BoxFit.fill,
          File(taskModel.image!),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskModel.title!,
                style: AppTextStyles.styleBold24,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                taskModel.desc!,
                style: AppTextStyles.styleRegular14,
              ),
              const SizedBox(
                height: 16,
              ),
              InfoItemWidget(
                widget: Text(
                  taskModel.createdAt!.toLocal().toString().split(' ')[0],
                ),
                icon: Icons.calendar_month,
              ),
              const SizedBox(
                height: 8,
              ),
              InfoItemWidget(
                widget: Text(
                  taskModel.status!,
                  style: AppTextStyles.styleBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                icon: Icons.arrow_drop_down_rounded,
              ),
              const SizedBox(
                height: 8,
              ),
              InfoItemWidget(
                widget: Row(
                  children: [
                    const Icon(
                      Icons.flag_outlined,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      taskModel.priority!,
                      style: AppTextStyles.styleBold16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                icon: Icons.arrow_drop_down_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
