import 'package:dartz/dartz.dart';
import 'package:tasky/core/errors/failure.dart';
import 'package:tasky/features/home/data/models/create_task_model.dart';
import 'package:tasky/features/home/data/models/task_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, Map<String, dynamic>>> logout({required String token});
  Future<Either<Failure, TaskModel>> addTask({
    required String token,
    required CreateTaskModel createTaskModel,
  });
  Future<Either<Failure, List<TaskModel>>> getAllTasks({
    required String token,
  });
  Future<Either<Failure, TaskModel>> deleteTask({
    required String token,
    required String taskId,
  });
}
