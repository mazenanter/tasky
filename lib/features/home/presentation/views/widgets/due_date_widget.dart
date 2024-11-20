import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';

class DueDataWidget extends StatelessWidget {
  const DueDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<AddTaskCubit>().selectDate(context);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff6E6A7C),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      context.read<AddTaskCubit>().selectedDate == null
                          ? 'Choose due data...'
                          : context
                              .read<AddTaskCubit>()
                              .selectedDate!
                              .toLocal()
                              .toString()
                              .split(' ')[0],
                      style: AppTextStyles.styleRegular14.copyWith(
                        color: const Color(0xff6E6A7C),
                      )),
                  const Icon(
                    Icons.calendar_month,
                    color: AppColors.primaryColor,
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
