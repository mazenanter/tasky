import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/core/services/secure_storage.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.homeRepo) : super(LogoutInitial());
  final HomeRepo homeRepo;
  Future<void> logoutUser() async {
    emit(LogoutLoading());
    String? accessToken = await SecureStorage().getAccessToken();
    if (accessToken != null) {
      var res = await homeRepo.logout(
        token: accessToken,
      );
      return res.fold(
        (fail) => emit(LogoutError(fail.errMsg)),
        (success) {
          return emit(LogoutSuccess());
        },
      );
    }
  }
}
