part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutSuccess extends LogoutState {}

final class LogoutError extends LogoutState {
  final String errMsg;

  LogoutError(this.errMsg);
}

final class LogoutLoading extends LogoutState {}
