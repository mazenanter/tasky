part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetTasksSuccess extends HomeState {
  final List<TaskModel> taskModel;

  HomeGetTasksSuccess(this.taskModel);
}

final class HomeGetTasksLoading extends HomeState {}

final class HomeGetTasksError extends HomeState {
  final String errMsg;

  HomeGetTasksError(this.errMsg);
}

final class HomeLogoutSuccess extends HomeState {}

final class HomeLogoutError extends HomeState {
  final String errMsg;

  HomeLogoutError(this.errMsg);
}
