import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/widgets/custom_indicator.dart';
import 'package:tasky/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/views/widgets/task_item.dart';

class AllTasksView extends StatelessWidget {
  const AllTasksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeGetTasksLoading) {
          return const CustomIndicator();
        } else if (state is HomeGetTasksSuccess) {
          return ListView.separated(
            itemCount: state.taskModel.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 24,
            ),
            itemBuilder: (context, index) => TaskItem(
              taskModel: state.taskModel[index],
            ),
          );
        }
        return const Text(
          'Empty List',
        );
      },
    );
  }
}
