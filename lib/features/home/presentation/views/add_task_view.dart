import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_arrow_back.dart';
import 'package:tasky/features/home/presentation/views/widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: const CustomArrowBack(),
        title: const Text(
          'Add new task',
          style: AppTextStyles.styleBold16,
        ),
      ),
      body: const AddTaskViewBody(),
    );
  }
}
