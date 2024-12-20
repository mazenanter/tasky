import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/views/widgets/task_item.dart';

class InprogressView extends StatelessWidget {
  const InprogressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = context.read<HomeCubit>().inProgressTasksList;
        if (list.isNotEmpty) {
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
        }
        return const Center(
          child: Text(
            'no tasks yet in inProgress try add one..',
            style: AppTextStyles.styleBold18,
          ),
        );
      },
    );
  }
}
