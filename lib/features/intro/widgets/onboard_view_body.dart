import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/core/widgets/custom_art_image.dart';
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/features/intro/widgets/custom_body_text.dart';

class OnboardViewBody extends StatelessWidget {
  const OnboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomArtImage(),
        SizedBox(
          height: height * 0.024,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: CustomBodyTexts(height: height),
        ),
        SizedBox(
          height: height * 0.032,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: CustomButton(
            buttonText: 'Let’s Start',
            showArrow: true,
            height: height,
            onPressed: () {
              context.go(AppRoutes.kLoginView);
            },
          ),
        ),
      ],
    );
  }
}
