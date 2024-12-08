import 'package:dartz/dartz.dart';
import 'package:elearning_dashboard/core/errors/failure.dart';
import 'package:elearning_dashboard/features/login/domain/entity/user_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, void>> login(UserEntity user);
}
