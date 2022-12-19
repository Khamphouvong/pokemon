import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/core/usecase/usecase.dart';
import 'package:pokemon/features/pokedex/domain/entities/pokedex.dart';

import '../../domain/usecase/get_pokedex.dart';

part 'pokedex_state.dart';
part 'pokedex_cubit.freezed.dart';

@injectable
class PokedexCubit extends Cubit<PokedexState> {
  final GetPokedexUseCase getPokedexUseCase;
  PokedexCubit(this.getPokedexUseCase) : super(const PokedexState.initial());

  Future<void> getPokedex(int limit, int offset) async {
    emit(const PokedexState.loading());
    final request = await getPokedexUseCase(HaveParams(limit, offset));
    request.fold(
      (error) {
        emit(PokedexState.error(error.message));
      },
      (pokedex) => emit(
        PokedexState.loaded(pokedex),
      ),
    );
  }
}
