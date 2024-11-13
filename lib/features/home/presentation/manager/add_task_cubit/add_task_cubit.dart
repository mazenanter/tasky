import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/core/services/secure_storage.dart';
import 'package:tasky/features/home/data/models/create_task_model.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.homeRepo) : super(AddTaskInitial());
  File? imageFile;
  DateTime? selectedDate;
  String? selectedValue;
  GlobalKey<FormState> formKey = GlobalKey();
  final HomeRepo homeRepo;
  final List<String> items = [
    'low',
    'medium',
    'high',
  ];
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskContentController = TextEditingController();

  Future<void> pickGalleryImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile = File(image.path);
      emit(ImageSelected());
    }
  }

  Future<void> pickCameraImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      imageFile = File(image.path);
      emit(ImageSelected());
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      emit(DateSelected());
    }
  }

  void changePriority(String? value) {
    selectedValue = value;
    emit(ChangePriority());
  }

  Future<void> addOneTask({required CreateTaskModel model}) async {
    String? accessToken = await SecureStorage().getAccessToken();
    emit(AddTaskLoading());
    if (accessToken != null) {
      var res = await homeRepo.addTask(
        token: accessToken,
        createTaskModel: model,
      );
      return res.fold(
        (fail) {
          log(fail.errMsg);
          return emit(AddTaskError(fail.errMsg));
        },
        (success) => emit(AddTaskSuccess(success)),
      );
    }
  }

  void clearData() {
    taskTitleController.clear();
    taskContentController.clear();
    imageFile = null;
    selectedValue = null;
    selectedDate = null;
  }
}
