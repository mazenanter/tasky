import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_text_styles.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.styleMeduim12.copyWith(
                color: Colors.black45,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Islam Sayed',
              style: AppTextStyles.styleBold18.copyWith(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
