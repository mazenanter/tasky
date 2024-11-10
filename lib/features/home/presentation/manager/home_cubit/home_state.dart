part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLogoutSuccess extends HomeState {}

final class HomeLogoutError extends HomeState {
  final String errMsg;

  HomeLogoutError(this.errMsg);
}
