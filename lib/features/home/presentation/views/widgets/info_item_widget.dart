import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';

class InfoItemWidget extends StatelessWidget {
  const InfoItemWidget({
    super.key,
    required this.icon,
    required this.widget,
  });

  final IconData icon;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF0ECFF),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget,
            Icon(
              icon,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
