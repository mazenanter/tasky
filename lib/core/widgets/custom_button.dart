import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    required this.onPressed,
    this.showArrow = false,
    required this.buttonText,
  });

  final double height;
  final void Function() onPressed;
  final bool showArrow;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: AppTextStyles.styleBold19.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: height * 0.008,
            ),
            Visibility(
              visible: showArrow,
              child: Image.asset(
                'assets/images/Arrow - Left.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
