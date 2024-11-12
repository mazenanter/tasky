import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/errors/failure.dart';
import 'package:tasky/core/services/api_service.dart';
import 'package:tasky/features/home/data/models/create_task_model.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, Map<String, dynamic>>> logout(
      {required String token}) async {
    try {
      var res = await apiService.postRequest(
        endPoint: '/auth/logout',
        data: {},
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(res);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskModel>> addTask(
      {required String token, required CreateTaskModel createTaskModel}) async {
    try {
      var response = await apiService.postRequest(
        endPoint: '/todos',
        data: createTaskModel.toJson(),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      TaskModel model = TaskModel.fromJson(response);
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getAllTasks(
      {required String token}) async {
    try {
      var response = await apiService.getTasks(
        endPoint: '/todos',
        accessToken: token,
      );

      List<TaskModel> taskModelList =
          response.map((model) => TaskModel.fromJson(model)).toList();

      return right(taskModelList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
