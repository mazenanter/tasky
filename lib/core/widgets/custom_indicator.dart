import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      backgroundColor: Colors.white,
      color: AppColors.primaryColor,
    ));
  }
}
