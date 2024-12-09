import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/user_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, void>> login(UserEntity userEntity);
}
