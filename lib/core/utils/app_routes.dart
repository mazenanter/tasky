import 'package:go_router/go_router.dart';
import 'package:tasky/features/auth/presentation/views/login_view.dart';
import 'package:tasky/features/auth/presentation/views/register_view.dart';
import 'package:tasky/features/intro/views/onboard_view.dart';
import 'package:tasky/features/intro/views/splash_view.dart';

class AppRoutes {
  static const String kOnboardView = '/kOnboardView';
  static const String kLoginView = '/kLoginView';
  static const String kRegisterView = '/kRegisterView';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnboardView,
        builder: (context, state) => const OnboardView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
    ],
  );
}
