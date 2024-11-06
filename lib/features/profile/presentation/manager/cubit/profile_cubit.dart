import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/core/services/secure_storage.dart';
import 'package:tasky/features/profile/data/repo/repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> getUserInfo() async {
    emit(ProfileLoading());
    String? accessToken = await SecureStorage().getAccessToken();
    if (accessToken == null) {
      emit(ProfileError('No access token found'));
      return;
    }
    var res = await profileRepo.getUser(
      accessToken: accessToken,
    );
    return res.fold(
      (fail) {
        log(fail.errMsg);
        return emit(ProfileError(fail.errMsg));
      },
      (user) {
        final profileInfo = [
          {"title": "NAME", "value": user.displayName ?? "N/A"},
          {"title": "PHONE", "value": user.username ?? "N/A"},
          {"title": "LEVEL", "value": user.level ?? "N/A"},
          {"title": "YEARS OF EXPERIENCE", "value": "${user.experienceYears}"},
          {"title": "LOCATION", "value": user.address ?? "N/A"},
        ];
        return emit(ProfileSuccess(profileInfo));
      },
    );
  }
}
