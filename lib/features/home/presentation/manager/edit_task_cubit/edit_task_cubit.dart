import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/core/services/secure_storage.dart';
import 'package:tasky/features/home/data/models/edit_task_model.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit(this.homeRepo) : super(EditTaskInitial());
  final HomeRepo homeRepo;
  String? statusValue;
  String? priorityValue;
  GlobalKey<FormState> formKey = GlobalKey();
  File? imageFile;
  final List<String> priorityItems = [
    'low',
    'medium',
    'high',
  ];
  final List<String> statusItems = [
    'waiting',
    'inProgress',
    'finished',
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

  Future<void> editTasks({
    required String taskId,
    required EditTaskModel editTaskModel,
  }) async {
    String? token = await SecureStorage().getAccessToken();
    emit(EditTaskLoading());
    if (token != null) {
      var res = await homeRepo.editTask(
        token: token,
        taskId: taskId,
        editTaskModel: editTaskModel,
      );
      return res.fold(
        (fail) {
          log(fail.errMsg);
          return emit(EditTaskError(fail.errMsg));
        },
        (success) => emit(EditTaskSuccess()),
      );
    }
  }

  void changeStatus(String? value) {
    statusValue = value;
    emit(ChangeStatus());
  }

  void changePriority(String? value) {
    priorityValue = value;
    emit(ChangePriority());
  }
}
