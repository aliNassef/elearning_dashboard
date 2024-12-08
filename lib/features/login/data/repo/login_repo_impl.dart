import 'package:dartz/dartz.dart';

import 'package:elearning_dashboard/core/errors/failure.dart';
import 'package:elearning_dashboard/features/login/data/source/login_source.dart';

import 'package:elearning_dashboard/features/login/domain/entity/user_entity.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginSource authService;

  LoginRepoImpl({required this.authService});
  @override
  Future<Either<Failure, void>> login(UserEntity user) async {
    try {
      final user = await authService.login();
      CacheHelper.saveData(key: 'uid', value: user.id);
      return right(null);
    } on ServerException catch (e) {
      return left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
