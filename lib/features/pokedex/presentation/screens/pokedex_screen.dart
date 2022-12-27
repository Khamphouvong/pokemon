import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/configs/DI/config_dependencies.dart';
import 'package:pokemon/features/pokedex/domain/entities/pokedex.dart';
import 'package:pokemon/features/pokedex/presentation/cubit/pokedex_cubit.dart';
import 'package:pokemon/features/pokedex/presentation/screens/widgets/pokemon_list.dart';

class PokedexSceen extends StatefulWidget {
  const PokedexSceen({super.key});

  @override
  State<PokedexSceen> createState() => _PokedexSceenState();
}

class _PokedexSceenState extends State<PokedexSceen> {
  final ScrollController _scrollController = ScrollController();

  final List<Result> _pokemonList = [];

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    getIt<PokedexCubit>().close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: BlocConsumer<PokedexCubit, PokedexState>(
          listener: (context, state) {
            state.maybeWhen(loading: (() {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Loading")));
            }), loaded: (pokedex) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }, error: (message) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
            }, orElse: () {
              const SizedBox.shrink();
            });
          },
          builder: ((context, state) {
            return state.when(initial: () {
              return const SizedBox();
            }, loading: () {
              return _pokemonList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : PokemonList(
                      scrollController: _scrollController,
                      pokemonList: _pokemonList,
                    );
            }, loaded: ((pokedex) {
              _pokemonList.addAll(pokedex.resultEntity);
              return PokemonList(
                scrollController: _scrollController,
                pokemonList: _pokemonList,
              );
            }), error: (error) {
              return Center(
                child: Text(error, style: const TextStyle(color: Colors.red)),
              );
            });
          }),
        ));
  }
}
