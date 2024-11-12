import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/services/api_service.dart';
import 'package:tasky/core/services/bloc_observer.dart';
import 'package:tasky/core/utils/app_routes.dart';
import 'package:tasky/features/home/data/repo/home_repo_impl.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/manager/logout_cubit/logout_cubit.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogoutCubit(HomeRepoImpl(ApiService(Dio()))),
        ),
        BlocProvider(
          create: (context) => HomeCubit(HomeRepoImpl(ApiService(Dio()))),
        ),
        BlocProvider(
          create: (context) => AddTaskCubit(HomeRepoImpl(ApiService(Dio()))),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        title: 'tasky',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
