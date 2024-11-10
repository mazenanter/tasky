import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/core/services/secure_storage.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  getToken() {}
  Future<void> logoutUser() async {
    String? accessToken = await SecureStorage().getAccessToken();
    if (accessToken != null) {
      var res = await homeRepo.logout(
        token: accessToken,
      );
      return res.fold(
        (fail) => emit(HomeLogoutError(fail.errMsg)),
        (success) {
          return emit(HomeLogoutSuccess());
        },
      );
    }
  }
}
