part of 'edit_task_cubit.dart';

@immutable
sealed class EditTaskState {}

final class EditTaskInitial extends EditTaskState {}

final class EditTaskLoading extends EditTaskState {}

final class EditTaskSuccess extends EditTaskState {}

final class ImageSelected extends EditTaskState {}

final class ChangeStatus extends EditTaskState {}

final class ChangePriority extends EditTaskState {}

final class EditTaskError extends EditTaskState {
  final String errMsg;

  EditTaskError(this.errMsg);
}
