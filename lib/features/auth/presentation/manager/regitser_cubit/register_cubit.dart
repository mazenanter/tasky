import 'package:bloc/bloc.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/auth/data/models/auth_model.dart';
import 'package:tasky/features/auth/data/models/register_model.dart';
import 'package:tasky/features/auth/data/repos/repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController yearExperienceController = TextEditingController();
  TextEditingController experienceLevelController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String? countryCode;
  bool isShow = true;
  String? levelValue;
  List<DropDownValueModel> dropList = const [
    DropDownValueModel(name: 'fresh', value: 'fresh'),
    DropDownValueModel(name: 'junior', value: 'junior'),
    DropDownValueModel(name: 'midLevel', value: 'midLevel'),
    DropDownValueModel(name: 'senior', value: 'senior'),
  ];
  Future<void> registerUser(RegisterModel model) async {
    emit(RegisterLoading());
    var res = await registerRepo.regitser(
      model,
    );
    return res.fold(
      (fail) => emit(RegisterError(fail.errMsg)),
      (success) => emit(RegisterSuccess(success)),
    );
  }

  dynamic changeValue(dynamic value) {
    if (value is DropDownValueModel) {
      levelValue = value.value;
    } else {
      levelValue = null;
    }
    emit(LevelValueChange());
  }

  void visibility() {
    isShow = !isShow;
    emit(ChangeVisibility());
  }
}
