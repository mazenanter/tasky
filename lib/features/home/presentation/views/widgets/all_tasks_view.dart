import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_indicator.dart';
import 'package:tasky/core/widgets/snack_bar.dart';
import 'package:tasky/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/views/widgets/task_item.dart';

class AllTasksView extends StatelessWidget {
  const AllTasksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          successSnackbar(
            context,
            'Delete task successfully',
          );
          BlocProvider.of<HomeCubit>(context).getTasks();
        }
        if (state is DeleteTaskError) {
          errorSnackBar(
            context,
            state.errMsg,
          );
          BlocProvider.of<HomeCubit>(context).getTasks();
        }
      },
      builder: (context, state) {
        var list = context.read<HomeCubit>().allTasksList;
        if (state is HomeGetTasksLoading) {
          return const CustomIndicator();
        } else if (list.isNotEmpty) {
          return ListView.separated(
            itemCount: list.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 24,
            ),
            itemBuilder: (context, index) => TaskItem(
              onDelete: (value) {
                if (value == 'delete') {
                  context.read<HomeCubit>().deleteTaskk(
                        taskId: list[index].id!,
                      );
                }
                if (value == 'edit') {
                  GoRouter.of(context).push(
                    AppRoutes.kEditView,
                    extra: list[index],
                  );
                }
              },
              onTap: () {
                GoRouter.of(context).push(
                  AppRoutes.kDetailsView,
                  extra: list[index],
                );
              },
              taskModel: list[index],
            ),
          );
        } else if (state is HomeGetTasksError) {
          return Center(
            child: Text(
              state.errMsg,
              style: AppTextStyles.styleBold18,
            ),
          );
        } else if (list.isEmpty) {
          return const Center(
              child: Text(
            'No tasks yet, try add one...',
            style: AppTextStyles.styleBold18,
          ));
        }
        return const Center(
            child: Text(
          'No tasks yet, try add one...',
          style: AppTextStyles.styleBold18,
        ));
      },
    );
  }
}
