import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class CustomDropDwonButton extends StatefulWidget {
  const CustomDropDwonButton({
    super.key,
  });

  @override
  State<CustomDropDwonButton> createState() => _CustomDropDwonButtonState();
}

class _CustomDropDwonButtonState extends State<CustomDropDwonButton> {
  String? selectedValue;
  final List<String> items = [
    'Low Priority',
    'Medium Priority',
    'High Priority',
  ];

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
      items: items
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
                      item,
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
        setState(() {
          selectedValue = value;
        });
      },
      value: selectedValue,
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
