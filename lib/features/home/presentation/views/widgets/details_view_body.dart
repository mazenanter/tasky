import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/core/widgets/snack_bar.dart';
import 'package:tasky/features/home/data/models/edit_task_model.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_drop_down_priority_widget.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_drop_down_status_widget.dart';
import 'package:tasky/features/home/presentation/views/widgets/info_item_widget.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditTaskCubit, EditTaskState>(
      listener: (context, state) {
        if (state is EditTaskSuccess) {
          successSnackbar(
            context,
            'Edit task successfully',
          );
          GoRouter.of(context).go(AppRoutes.kHomeView);
          BlocProvider.of<HomeCubit>(context).getTasks();
        }
        if (state is EditTaskError) {
          errorSnackBar(
            context,
            state.errMsg,
          );
        }
      },
      builder: (context, state) {
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
                  CustomDropDownStatusWidget(
                    value: taskModel.status!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDropDownPriorityWidget(
                    value: taskModel.priority!,
                  ),
                  if (state is ChangeStatus)
                    const SizedBox(
                      height: 16,
                    ),
                  Visibility(
                    visible: state is ChangeStatus || state is ChangePriority,
                    child: CustomButton(
                      height: MediaQuery.sizeOf(context).height,
                      onPressed: () {
                        context.read<EditTaskCubit>().editTasks(
                              taskId: taskModel.id!,
                              editTaskModel: EditTaskModel(
                                image: taskModel.image!,
                                title: taskModel.title!,
                                desc: taskModel.desc!,
                                priority: context
                                        .read<EditTaskCubit>()
                                        .priorityValue ??
                                    taskModel.priority!,
                                status:
                                    context.read<EditTaskCubit>().statusValue ??
                                        taskModel.status!,
                                user: taskModel.user!,
                              ),
                            );
                      },
                      buttonText: 'Edit Task',
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
