import 'package:dartz/dartz.dart';
import 'package:tasky/core/errors/failure.dart';
import 'package:tasky/features/auth/data/models/auth_model.dart';
import 'package:tasky/features/auth/data/models/register_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, AuthModel>> regitser(RegisterModel registerModel);
}

abstract class LoginRepo {
  Future<Either<Failure, AuthModel>> login({
    required String phone,
    required String password,
  });
}
