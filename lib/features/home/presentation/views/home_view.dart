import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/services/secure_storage.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/core/utils/app_text_styles.dart';
import 'package:tasky/features/home/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:tasky/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Logo',
          style: AppTextStyles.styleBold24,
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kProfileView);
            },
            icon: const Icon(
              Icons.person_3_outlined,
            ),
          ),
          BlocConsumer<LogoutCubit, LogoutState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: IconButton(
                  onPressed: () {
                    context.read<LogoutCubit>().logoutUser();
                    SecureStorage().removeAccessToken();
                    context.go(AppRoutes.kLoginView);
                  },
                  icon: const Icon(
                    Icons.logout_rounded,
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: const HomeViewBody(),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          FloatingActionButton(
            heroTag: 'mainFab',
            backgroundColor: AppColors.primaryColor,
            shape: const CircleBorder(),
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kAddTaskView);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 74),
            child: FloatingActionButton(
              heroTag: 'qrButton',
              backgroundColor: AppColors.unSelectedColor,
              shape: const CircleBorder(),
              mini: true,
              onPressed: () {
                log(
                  'dsadas',
                );
              },
              child: const Icon(
                Icons.qr_code,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
