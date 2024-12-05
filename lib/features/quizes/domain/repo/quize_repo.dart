import 'package:dartz/dartz.dart';
import 'package:elearning_dashboard/core/errors/failure.dart';
import 'package:elearning_dashboard/features/quizes/domain/entity/quize_entity.dart';

abstract class QuizeRepo {
  Future<Either<Failure, void>> addQuize(QuizeEntity quize);
}
