import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class HaveParams extends Equatable {
  final int limit;
  final int offset;

  const HaveParams(this.limit, this.offset);

  @override
  List<Object> get props => [limit, offset];
}
