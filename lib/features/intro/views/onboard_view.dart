import 'package:flutter/material.dart';
import 'package:tasky/features/intro/widgets/onboard_view_body.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardViewBody(),
    );
  }
}
