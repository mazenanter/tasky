import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tasky/core/utils/app_colors.dart';

class PhoneTextFeild extends StatelessWidget {
  const PhoneTextFeild({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
  });
  final TextEditingController controller;
  final String? Function(PhoneNumber?)? validator;
  final void Function(PhoneNumber)? onChanged;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'phone number is required';
        }
        return null;
      },
      controller: controller,
      initialCountryCode: 'EG',
      initialValue: 'EG',
      disableLengthCheck: true,
      decoration: InputDecoration(
        hintText: '123 456-7890',
        hintStyle: const TextStyle(
          color: Color(0xffBABABA),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
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
