import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/core/errors/failure.dart';
import 'package:pokemon/core/usecase/usecase.dart';
import 'package:pokemon/features/pokedex/domain/entities/pokedex.dart';
import 'package:pokemon/features/pokedex/domain/repositories/pokedex_repository.dart';

@lazySingleton
class GetPokedexUseCase implements UseCase<Pokedex, HaveParams> {
  final PokedexRepository repository;
  GetPokedexUseCase(this.repository);

  @override
  Future<Either<Failure, Pokedex>> call(HaveParams haveParams) async {
    return await repository.getPokedex(haveParams.limit, haveParams.offset);
  }
}
