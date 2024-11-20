part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final List<Map<String, dynamic>> userModel;

  ProfileSuccess(this.userModel);
}

final class ProfileError extends ProfileState {
  final String errMsg;

  ProfileError(this.errMsg);
}
