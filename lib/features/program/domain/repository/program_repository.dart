import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/features/program/domain/entity/program.dart';

abstract class ProgramRepository {
  Future<Either<Failure, List<Program>>> getAll();
}
