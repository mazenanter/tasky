import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    required this.controller,
    this.secureText = false,
    this.onPressedIcon,
    this.validator,
  });
  final String hintText;
  final TextEditingController controller;
  final IconData? icon;
  final bool secureText;
  final void Function()? onPressedIcon;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: validator,
      obscureText: secureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xff7F7F7F),
          fontSize: 14,
        ),
        suffixIcon: IconButton(
          onPressed: onPressedIcon,
          icon: Icon(
            icon,
            color: const Color(0xffBABABA),
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColors.borderColor,
      ),
    );
  }
}
