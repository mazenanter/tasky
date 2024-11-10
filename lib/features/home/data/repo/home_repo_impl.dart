import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/errors/failure.dart';
import 'package:tasky/core/services/api_service.dart';
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
}
