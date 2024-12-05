import 'package:dartz/dartz.dart';
import 'package:elearning_dashboard/core/errors/failure.dart';
import 'package:elearning_dashboard/features/quizes/data/model/quize_model.dart';
import 'package:elearning_dashboard/features/quizes/data/source/quize_source.dart';
import 'package:elearning_dashboard/features/quizes/domain/entity/quize_entity.dart';
import 'package:elearning_dashboard/features/quizes/domain/repo/quize_repo.dart';

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
