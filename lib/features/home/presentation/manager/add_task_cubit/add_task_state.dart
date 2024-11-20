part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskLoading extends AddTaskState {}

final class AddTaskError extends AddTaskState {
  final String errMsg;

  AddTaskError(this.errMsg);
}

final class AddTaskSuccess extends AddTaskState {
  final TaskModel taskModel;

  AddTaskSuccess(this.taskModel);
}

final class ImageSelected extends AddTaskState {}

final class DateSelected extends AddTaskState {}

final class ChangePriority extends AddTaskState {}
