part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class LevelValueChange extends RegisterState {}

final class ChangeVisibility extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final AuthModel authModel;

  RegisterSuccess(this.authModel);
}

final class RegisterError extends RegisterState {
  final String errMsg;

  RegisterError(this.errMsg);
}
