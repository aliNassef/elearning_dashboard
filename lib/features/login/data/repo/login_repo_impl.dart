import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../source/login_source.dart';

import '../../domain/entity/user_entity.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginSource authService;

  LoginRepoImpl({required this.authService});
  @override
  Future<Either<Failure, void>> login(UserEntity userEntity) async {
    try {
      final user = await authService.login(
        email: userEntity.email,
        password: userEntity.password,
      );
      CacheHelper.saveData(key: 'uid', value: user.uid);
      return right(null);
    } on ServerException catch (e) {
      return left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
