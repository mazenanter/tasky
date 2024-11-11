import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/features/home/presentation/views/widgets/add_image_widget.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:tasky/features/home/presentation/views/widgets/custom_text_form_field_add.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AddImageWidget(),
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
          const CustomTextFromFieldAdd(
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
          const CustomTextFromFieldAdd(
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
          const CustomTextFromFieldAdd(
            sufIcon: Icons.calendar_month,
            title: 'choose due date...',
          ),
          SizedBox(
            height: height * 0.028,
          ),
          CustomButton(
            height: height,
            onPressed: () {},
            buttonText: 'Add task',
          ),
        ],
      ),
    );
  }
}
