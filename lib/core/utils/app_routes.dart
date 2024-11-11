import 'package:go_router/go_router.dart';
import 'package:tasky/features/auth/presentation/views/login_view.dart';
import 'package:tasky/features/auth/presentation/views/register_view.dart';
import 'package:tasky/features/home/presentation/views/add_task_view.dart';
import 'package:tasky/features/home/presentation/views/home_view.dart';
import 'package:tasky/features/intro/views/onboard_view.dart';
import 'package:tasky/features/intro/views/splash_view.dart';
import 'package:tasky/features/profile/presentation/views/profile_view.dart';

class AppRoutes {
  static const String kOnboardView = '/kOnboardView';
  static const String kLoginView = '/kLoginView';
  static const String kRegisterView = '/kRegisterView';
  static const String kHomeView = '/kHomeView';
  static const String kProfileView = '/kProfileView';
  static const String kAddTaskView = '/kAddTaskView';
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
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kAddTaskView,
        builder: (context, state) => const AddTaskView(),
      ),
    ],
  );
}
