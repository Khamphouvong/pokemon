part of 'pokedex_cubit.dart';

@freezed
class PokedexState with _$PokedexState {
  const factory PokedexState.initial() = _Initial;
  const factory PokedexState.loading() = _Loading;
  const factory PokedexState.loaded(Pokedex pokedex) = _Loaded;
  const factory PokedexState.error(String message) = _Error;
}
