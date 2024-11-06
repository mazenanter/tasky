import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/errors/failure.dart';
import 'package:tasky/core/services/api_service.dart';
import 'package:tasky/features/profile/data/models/user_model.dart';
import 'package:tasky/features/profile/data/repo/repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiService apiService;

  ProfileRepoImpl(this.apiService);
  @override
  Future<Either<Failure, UserModel>> getUser({
    required String accessToken,
  }) async {
    try {
      var response = await apiService.getRequest(
        endPoint: '/auth/profile',
        accessToken: accessToken,
      );
      UserModel model = UserModel.fromJson(response);
      return right(model);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioErr(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
