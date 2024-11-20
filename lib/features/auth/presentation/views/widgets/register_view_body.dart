import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/func/valid_inputs.dart';
import 'package:tasky/core/services/api_service.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/core/widgets/custom_indicator.dart';
import 'package:tasky/core/widgets/snack_bar.dart';
import 'package:tasky/features/auth/data/models/register_model.dart';
import 'package:tasky/features/auth/data/repos/repo_impl.dart';
import 'package:tasky/features/auth/presentation/manager/regitser_cubit/register_cubit.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_drop_down_field.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_text_button_auth.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:tasky/features/auth/presentation/views/widgets/phone_text_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return BlocProvider(
      create: (context) => RegisterCubit(RegitserRepoImpl(ApiService(Dio()))),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            successSnackbar(
              context,
              'register successfilly',
            );
            context.go(AppRoutes.kLoginView);
          } else if (state is RegisterError) {
            errorSnackBar(
              context,
              state.errMsg,
            );
          }
        },
        builder: (context, state) {
          var controller = context.read<RegisterCubit>();
          return SingleChildScrollView(
            child: Form(
              key: controller.formKey,
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
                        padding: const EdgeInsets.only(
                            right: 24, left: 24, top: 280),
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
                            CustomTextFormField(
                              validator: (value) {
                                return validInput(
                                  value,
                                  3,
                                  'name',
                                  context,
                                );
                              },
                              controller: controller.nameController,
                              hintText: 'Name...',
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            PhoneTextFeild(
                              onChanged: (phone) {
                                controller.countryCode = phone.countryCode;
                              },
                              controller: controller.phoneController,
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            CustomTextFormField(
                              validator: (value) {
                                return validInput(
                                  value,
                                  0,
                                  'gen',
                                  context,
                                );
                              },
                              controller: controller.yearExperienceController,
                              hintText: 'Years of experience...',
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            CustomDropDownField(
                              onChanged: (value) {
                                controller.changeValue(value);
                              },
                              dropList: controller.dropList,
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            CustomTextFormField(
                              validator: (value) {
                                return validInput(value, 0, 'gen', context);
                              },
                              controller: controller.addressController,
                              hintText: 'Address...',
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            CustomTextFormField(
                              validator: (value) =>
                                  validInput(value, 6, 'password', context),
                              onPressedIcon: () {
                                controller.visibility();
                              },
                              secureText: controller.isShow,
                              controller: controller.passwordController,
                              icon: controller.isShow
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility_off_outlined,
                              hintText: 'Password...',
                            ),
                            SizedBox(
                              height: height * 0.024,
                            ),
                            ConditionalBuilder(
                              condition: state is RegisterLoading,
                              builder: (context) => const CustomIndicator(),
                              fallback: (context) => CustomButton(
                                  buttonText: 'Sign up',
                                  height: height,
                                  onPressed: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.registerUser(
                                        RegisterModel(
                                          phone: controller.countryCode! +
                                              controller.phoneController.text,
                                          password: controller
                                              .passwordController.text,
                                          displayName:
                                              controller.nameController.text,
                                          experienceYears: int.tryParse(
                                                  controller
                                                      .yearExperienceController
                                                      .text) ??
                                              0,
                                          address:
                                              controller.addressController.text,
                                          level: controller.levelValue!,
                                        ),
                                      );
                                    }
                                    log(controller.countryCode! +
                                        controller.phoneController.text);
                                  }),
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
            ),
          );
        },
      ),
    );
  }
}
