import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/services/secure_storage.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/core/utils/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String? onBoardDone;
  String? token;
  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: Image.asset('assets/images/splash_logo.png')),
    );
  }

  Future<void> navigateTo() async {
    onBoardDone = await SecureStorage().getValue('onBoardDone');
    token = await SecureStorage().getAccessToken();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        if (mounted) {
          if (token != null) {
            GoRouter.of(context).go(AppRoutes.kHomeView);
          } else {
            if (onBoardDone != null) {
              GoRouter.of(context).go(AppRoutes.kLoginView);
            } else {
              GoRouter.of(context).go(AppRoutes.kOnboardView);
            }
          }
        }
      },
    );
  }
}
