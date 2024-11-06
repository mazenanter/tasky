import 'package:dartz/dartz.dart';
import 'package:tasky/core/errors/failure.dart';
import 'package:tasky/features/profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> getUser({
    required String accessToken,
  });
}
