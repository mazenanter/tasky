import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/func/valid_inputs.dart';
import 'package:tasky/core/services/api_service.dart';
import 'package:tasky/core/services/secure_storage.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/core/widgets/custom_indicator.dart';
import 'package:tasky/core/widgets/snack_bar.dart';
import 'package:tasky/features/auth/data/repos/repo_impl.dart';
import 'package:tasky/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_text_button_auth.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:tasky/features/auth/presentation/views/widgets/phone_text_field.dart';

class BottomLoginBody extends StatelessWidget {
  const BottomLoginBody({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl(ApiService(Dio()))),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            SecureStorage().saveAccessToken(state.authModel.accessToken);
            successSnackbar(
              context,
              'login successfully',
            );

            context.go(AppRoutes.kHomeView);
          } else if (state is LoginError) {
            errorSnackBar(
              context,
              state.errMsg,
            );
          }
        },
        builder: (context, state) {
          var controller = context.read<LoginCubit>();
          return Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: AppTextStyles.styleBold24,
                ),
                SizedBox(
                  height: height * 0.024,
                ),
                PhoneTextFeild(
                  controller: controller.phoneController,
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                CustomTextFormField(
                  secureText: controller.isShow,
                  onPressedIcon: () {
                    controller.visibility();
                  },
                  icon: controller.isShow
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                  validator: (value) {
                    return validInput(value, 6, 'password', context);
                  },
                  controller: controller.passwordController,
                  hintText: 'Password...',
                ),
                SizedBox(
                  height: height * 0.024,
                ),
                ConditionalBuilder(
                  condition: state is LoginLoading,
                  builder: (context) => const CustomIndicator(),
                  fallback: (context) => CustomButton(
                    buttonText: 'Sign In',
                    height: height,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.lgoinUser(
                          phone: controller.phoneController.text,
                          password: controller.passwordController.text,
                        );
                      }
                    },
                  ),
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
            ),
          );
        },
      ),
    );
  }
}
