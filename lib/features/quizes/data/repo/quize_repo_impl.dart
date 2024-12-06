import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/quize_model.dart';
import '../source/quize_source.dart';
import '../../domain/entity/quize_entity.dart';
import '../../domain/repo/quize_repo.dart';

import '../../../../core/errors/exceptions.dart';

class QuizeRepoImpl extends QuizeRepo {
  final QuizeSource quizeSource;

  QuizeRepoImpl({required this.quizeSource});
  @override
  Future<Either<Failure, void>> addQuize(QuizeEntity quize) async {
    try {
      await quizeSource.addQuize(QuizeModel.formEntity(quize));
      return right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
