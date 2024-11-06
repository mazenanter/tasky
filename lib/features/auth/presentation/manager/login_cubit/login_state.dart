part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class ChangeVisibility extends LoginState {}

final class LoginSuccess extends LoginState {
  final AuthModel authModel;

  LoginSuccess(this.authModel);
}

final class LoginError extends LoginState {
  final String errMsg;

  LoginError(this.errMsg);
}
