import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/func/valid_inputs.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/core/widgets/custom_indicator.dart';
import 'package:tasky/core/widgets/snack_bar.dart';
import 'package:tasky/features/home/data/models/create_task_model.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_text_form_field_add.dart';
import 'package:tasky/features/home/presentation/views/widgets/due_date_widget.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          successSnackbar(
            context,
            'Task Added Successfully',
          );

          GoRouter.of(context).pop();
          BlocProvider.of<HomeCubit>(context).getTasks();
        } else if (state is AddTaskError) {
          errorSnackBar(
            context,
            state.errMsg,
          );
        }
      },
      builder: (context, state) {
        var controller = context.read<AddTaskCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Task title',
                    style: AppTextStyles.styleMeduim12.copyWith(
                      color: const Color(0xff6E6A7C),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFromFieldAdd(
                    validator: (value) {
                      return validInput(value, 6, 'gen', context);
                    },
                    controller: controller.taskTitleController,
                    title: 'Enter title here...',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Task Description',
                    style: AppTextStyles.styleMeduim12.copyWith(
                      color: const Color(0xff6E6A7C),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFromFieldAdd(
                    validator: (value) {
                      return validInput(value, 10, 'gen', context);
                    },
                    controller: controller.taskContentController,
                    maxLength: 7,
                    title: 'Enter description here...',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Priority',
                    style: AppTextStyles.styleMeduim12.copyWith(
                      color: const Color(0xff6E6A7C),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomDropDwonButton(),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Due date',
                    style: AppTextStyles.styleMeduim12.copyWith(
                      color: const Color(0xff6E6A7C),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const DueDataWidget(),
                  SizedBox(
                    height: height * 0.028,
                  ),
                  ConditionalBuilder(
                    condition: state is AddTaskLoading,
                    builder: (context) => const CustomIndicator(),
                    fallback: (context) {
                      return CustomButton(
                        height: height,
                        onPressed: () {
                          if (controller.selectedValue == null) {
                            errorSnackBar(
                              context,
                              'please select priority',
                            );
                          }
                          if (controller.formKey.currentState!.validate()) {
                            if (controller.selectedValue != null) {
                              controller.addOneTask(
                                model: CreateTaskModel(
                                  image:
                                      'https://img.freepik.com/free-vector/focus-abstract-concept_335657-3014.jpg?t=st=1732049147~exp=1732052747~hmac=a6cf5a06cac570775234e9a006ed302af5c9c95425bdb149b50890932ace5a53&w=740',
                                  title: controller.taskTitleController.text,
                                  desc: controller.taskContentController.text,
                                  priority: controller.selectedValue.toString(),
                                  dueDate: controller.selectedDate.toString(),
                                ),
                              );
                              controller.clearData();
                            }
                          }
                        },
                        buttonText: 'Add task',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
