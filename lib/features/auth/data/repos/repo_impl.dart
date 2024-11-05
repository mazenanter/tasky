import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/errors/failure.dart';
import 'package:tasky/core/services/api_service.dart';
import 'package:tasky/features/auth/data/models/auth_model.dart';
import 'package:tasky/features/auth/data/models/register_model.dart';
import 'package:tasky/features/auth/data/repos/register_repo.dart';

class RegitserRepoImpl extends RegisterRepo {
  final ApiService apiService;

  RegitserRepoImpl(this.apiService);
  @override
  Future<Either<Failure, AuthModel>> regitser(
      RegisterModel registerModel) async {
    try {
      var response = await apiService.postRequest(
        endPoint: '/auth/register',
        data: registerModel.toJson(),
      );

      AuthModel authModel = AuthModel.fromJson(response);
      return right(authModel);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioErr(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
