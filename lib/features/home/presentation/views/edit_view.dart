import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_arrow_back.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/presentation/views/widgets/edit_view_body.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: const CustomArrowBack(),
        title: const Text(
          'Edit task',
          style: AppTextStyles.styleBold16,
        ),
      ),
      body: EditViewBody(
        taskModel: taskModel,
      ),
    );
  }
}
