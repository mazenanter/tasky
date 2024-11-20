import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/auth/data/models/auth_model.dart';
import 'package:tasky/features/auth/data/repos/repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isShow = true;
  Future<void> lgoinUser(
      {required String phone, required String password}) async {
    emit(LoginLoading());
    var res = await loginRepo.login(
      password: password,
      phone: phone,
    );
    return res.fold(
      (fail) => emit(LoginError(fail.errMsg)),
      (success) => emit(LoginSuccess(success)),
    );
  }

  void visibility() {
    isShow = !isShow;
    emit(ChangeVisibility());
  }
}
