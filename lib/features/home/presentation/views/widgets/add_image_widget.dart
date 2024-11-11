import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              content: const Text(
                'Choose Source',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.read<AddTaskCubit>().pickGalleryImage();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Gallery',
                    style: AppTextStyles.styleBold14.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<AddTaskCubit>().pickCameraImage();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Camera',
                    style: AppTextStyles.styleBold14.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: BlocBuilder<AddTaskCubit, AddTaskState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primaryColor,
              ),
            ),
            child: context.read<AddTaskCubit>().imageFile != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      height: MediaQuery.sizeOf(context).height * 0.200,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      context.read<AddTaskCubit>().imageFile!,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.image_outlined,
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Add Img',
                          style: AppTextStyles.styleMeduim19.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
