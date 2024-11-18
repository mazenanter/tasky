import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_arrow_back.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_popup_menu_button.dart';
import 'package:tasky/features/home/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(),
        title: const Text(
          'Task Details',
          style: AppTextStyles.styleBold16,
        ),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CustomPopupMenuButton(
              onSelected: (value) {
                if (value == 'delete') {
                  context.read<HomeCubit>().deleteTaskk(taskId: taskModel.id!);
                  GoRouter.of(context).pop();
                  BlocProvider.of<HomeCubit>(context).getTasks();
                }
                if (value == 'edit') {
                  GoRouter.of(context).push(
                    AppRoutes.kEditView,
                    extra: taskModel,
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: DetailsViewBody(
        taskModel: taskModel,
      ),
    );
  }
}
