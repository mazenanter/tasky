import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Image.asset('assets/images/ArrowBack.png'));
  }
}
