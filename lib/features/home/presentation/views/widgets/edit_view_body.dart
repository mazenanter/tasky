import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/core/widgets/custom_indicator.dart';
import 'package:tasky/core/widgets/snack_bar.dart';
import 'package:tasky/features/home/data/models/edit_task_model.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_drop_down_priority_widget.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_drop_down_status_widget.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_text_form_field_add.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<EditTaskCubit>().taskTitleController.text =
        widget.taskModel.title!;
    context.read<EditTaskCubit>().taskContentController.text =
        widget.taskModel.desc!;
  }

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
        var controller = context.read<EditTaskCubit>();

        return SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    children: [
                      CustomTextFromFieldAdd(
                        title: 'title',
                        controller: controller.taskTitleController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFromFieldAdd(
                        maxLength: 7,
                        title: 'desc',
                        controller: controller.taskContentController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomDropDownPriorityWidget(
                        value: widget.taskModel.priority!,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomDropDownStatusWidget(
                        value: widget.taskModel.status!,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ConditionalBuilder(
                        condition: state is EditTaskLoading,
                        builder: (context) => const CustomIndicator(),
                        fallback: (context) => CustomButton(
                          height: MediaQuery.sizeOf(context).height,
                          onPressed: () {
                            controller.editTasks(
                              taskId: widget.taskModel.id!,
                              editTaskModel: EditTaskModel(
                                image: controller.imageFile?.path ??
                                    widget.taskModel.image!,
                                title: controller.taskTitleController.text,
                                desc: controller.taskContentController.text,
                                priority:
                                    controller.priorityValue?.toString() ??
                                        widget.taskModel.priority.toString(),
                                status: controller.statusValue?.toString() ??
                                    widget.taskModel.status!,
                                user: widget.taskModel.user!,
                              ),
                            );
                          },
                          buttonText: 'Edit task',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
