import 'package:flutter/material.dart';

String? validInput(String? value, int min, String type, BuildContext context) {
  if (type == 'gen') {
    if (value == null || value.isEmpty) {
      return 'please fill this field ';
    }
  } else if (type == 'password') {
    if (value == null || value.isEmpty) {
      return 'password is required';
    } else if (value.length < min) {
      return 'Password must be at least 6 characters';
    }
  } else if (type == 'name') {
    if (value == null || value.isEmpty) {
      return 'name is required';
    } else if (value.length < min) {
      return 'Username must be at least 3 characters';
    }
  } else if (type == 'phone') {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
  }

  return null;
}
