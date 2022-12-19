import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/core/errors/exceptions.dart';
import 'package:pokemon/core/errors/failure.dart';
import 'package:pokemon/features/pokedex/data/datasource/pokedex_remote_data_source.dart';
import 'package:pokemon/features/pokedex/domain/entities/pokedex.dart';
import 'package:pokemon/features/pokedex/domain/repositories/pokedex_repository.dart';

@LazySingleton(as: PokedexRepository)
class PokedexRepositoryImpl implements PokedexRepository {
  final PokedexRemoteDataSource pokedexRemoteDataSource;

  PokedexRepositoryImpl(
    this.pokedexRemoteDataSource,
  );

  @override
  Future<Either<Failure, Pokedex>> getPokedex(int limit, int offset) async {
    try {
      final data = await pokedexRemoteDataSource.getPokedex(limit, offset);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }
}
