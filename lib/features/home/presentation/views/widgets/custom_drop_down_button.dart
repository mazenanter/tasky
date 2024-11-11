import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';

class CustomDropDwonButton extends StatelessWidget {
  const CustomDropDwonButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        return DropdownButton2(
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              color: AppColors.primaryColor,
              size: 44,
            ),
          ),
          buttonStyleData: ButtonStyleData(
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: BoxDecoration(
              color: const Color(0xffF0ECFF),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          isExpanded: true,
          hint: Row(
            children: [
              const Icon(
                Icons.flag_outlined,
                size: 32,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'Select Priority',
                  style: AppTextStyles.styleBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: context
              .read<AddTaskCubit>()
              .items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.flag_outlined,
                          size: 32,
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$item Priority',
                          style: AppTextStyles.styleBold16.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ))
              .toList(),
          onChanged: (String? value) {
            context.read<AddTaskCubit>().changePriority(value);
          },
          value: context.read<AddTaskCubit>().selectedValue,
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color(0xffF0ECFF),
            ),
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: WidgetStateProperty.all<double>(6),
              thumbVisibility: WidgetStateProperty.all<bool>(true),
            ),
          ),
        );
      },
    );
  }
}
