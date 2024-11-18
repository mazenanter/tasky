import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/services/secure_storage.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  List<TaskModel> allTasksList = [];
  List<TaskModel> inProgressTasksList = [];
  List<TaskModel> waitingTasksList = [];
  List<TaskModel> finishedTasksList = [];
  Future<void> getTasks() async {
    emit(HomeGetTasksLoading());
    String? token = await SecureStorage().getAccessToken();
    if (token != null) {
      var res = await homeRepo.getAllTasks(
        token: token,
      );
      return res.fold(
        (fail) {
          log(fail.errMsg);
          return emit(HomeGetTasksError(fail.errMsg));
        },
        (tasks) {
          allTasksList = tasks;
          inProgressTasksList.clear();
          waitingTasksList.clear();
          finishedTasksList.clear();
          for (int i = 0; i < tasks.length; i++) {
            if (tasks[i].status == 'waiting') {
              waitingTasksList.add(tasks[i]);
            } else if (tasks[i].status == 'inProgress') {
              inProgressTasksList.add(tasks[i]);
            } else if (tasks[i].status == 'finished') {
              finishedTasksList.add(tasks[i]);
            }
          }
          return emit(HomeGetTasksSuccess(tasks));
        },
      );
    }
  }

  Future<void> deleteTaskk({required String taskId}) async {
    String? token = await SecureStorage().getAccessToken();
    if (token != null) {
      var res = await homeRepo.deleteTask(
        token: token,
        taskId: taskId,
      );
      return res.fold(
        (fail) {
          log(fail.errMsg);
          return emit(DeleteTaskError(fail.errMsg));
        },
        (success) {
          log(success.id!);
          return emit(DeleteTaskSuccess());
        },
      );
    }
  }
}
