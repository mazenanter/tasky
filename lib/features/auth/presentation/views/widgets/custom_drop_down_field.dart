import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField({
    super.key,
    required this.dropList,
    this.onChanged,
  });
  final List<DropDownValueModel> dropList;
  final Function(dynamic)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      onChanged: onChanged,
      dropDownIconProperty: IconProperty(
        icon: Icons.keyboard_arrow_down_rounded,
      ),
      dropDownItemCount: 4,
      dropdownRadius: 10,
      textFieldDecoration: InputDecoration(
        hintText: 'Choose experience Level',
        hintStyle: const TextStyle(
          color: Color(0xff2F2F2F),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
        ),
      ),
      dropDownList: dropList,
    );
  }
}
