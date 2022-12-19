import 'package:dartz/dartz.dart';
import 'package:pokemon/core/errors/failure.dart';
import 'package:pokemon/features/pokedex/domain/entities/pokedex.dart';

abstract class PokedexRepository {
  Future<Either<Failure, Pokedex>> getPokedex(int limit, int offset);
}
