import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/quize_entity.dart';

abstract class QuizeRepo {
  Future<Either<Failure, void>> addQuize(QuizeEntity quize);
}
