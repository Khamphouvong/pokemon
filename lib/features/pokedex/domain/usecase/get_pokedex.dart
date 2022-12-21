import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/core/errors/failure.dart';
import 'package:pokemon/core/usecase/usecase.dart';
import 'package:pokemon/features/pokedex/domain/entities/pokedex.dart';
import 'package:pokemon/features/pokedex/domain/repositories/pokedex_repository.dart';

@lazySingleton
class GetPokedexUseCase implements UseCase<Pokedex, GetPokedex> {
  final PokedexRepository pokedexRepository;
  GetPokedexUseCase(this.pokedexRepository);

  @override
  Future<Either<Failure, Pokedex>> call(GetPokedex getPokedex) async {
    return await pokedexRepository.getPokedex(
        getPokedex.limit, getPokedex.offset);
  }
}
