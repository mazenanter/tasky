import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';

class CustomDropDownStatusWidget extends StatelessWidget {
  const CustomDropDownStatusWidget({super.key, required this.value});
  final String value;
  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.styleBold16.copyWith(
                color: AppColors.primaryColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      items: context
          .read<EditTaskCubit>()
          .statusItems
          .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: AppTextStyles.styleBold16.copyWith(
                    color: item == 'waiting'
                        ? AppColors.waitingTextColor
                        : item == 'inProgress'
                            ? AppColors.primaryColor
                            : AppColors.finishedTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      onChanged: (String? value) {
        context.read<EditTaskCubit>().changeStatus(value);
      },
      value: context.read<EditTaskCubit>().statusValue,
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
  }
}
