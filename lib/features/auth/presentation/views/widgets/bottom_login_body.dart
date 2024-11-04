import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_text_button_auth.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class BottomLoginBody extends StatelessWidget {
  const BottomLoginBody({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Login',
          style: AppTextStyles.styleBold24,
        ),
        SizedBox(
          height: height * 0.024,
        ),
        const CustomTextFormField(),
        SizedBox(
          height: height * 0.020,
        ),
        const CustomTextFormField(),
        SizedBox(
          height: height * 0.024,
        ),
        CustomButton(
          buttonText: 'Sign In',
          height: height,
          onPressed: () {
            context.go(AppRoutes.kHomeView);
          },
        ),
        SizedBox(
          height: height * 0.024,
        ),
        CustomTextButtonAuth(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kRegisterView);
          },
        ),
      ],
    );
  }
}
