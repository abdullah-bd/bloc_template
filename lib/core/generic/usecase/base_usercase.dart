import 'package:dartz/dartz.dart';
import 'package:owl_commerce/core/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}