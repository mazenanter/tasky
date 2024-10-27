import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_text_button_auth.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image.asset(
                width: 375,
                height: 482,
                'assets/images/Frame 4.png',
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, top: 280),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign Up',
                      style: AppTextStyles.styleBold24,
                    ),
                    SizedBox(
                      height: height * 0.024,
                    ),
                    const CustomTextFormField(),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    const CustomTextFormField(),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    const CustomTextFormField(),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    const CustomTextFormField(),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    const CustomTextFormField(),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    const CustomTextFormField(),
                    SizedBox(
                      height: height * 0.024,
                    ),
                    CustomButton(
                      buttonText: 'Sign up',
                      height: height,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: height * 0.024,
                    ),
                    CustomTextButtonAuth(
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
