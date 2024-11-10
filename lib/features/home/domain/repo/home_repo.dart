import 'package:dartz/dartz.dart';
import 'package:tasky/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, Map<String, dynamic>>> logout({required String token});
}
