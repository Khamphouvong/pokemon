import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/utils/string_extension.dart';
import 'package:pokemon/features/pokedex/domain/entities/pokedex.dart';
import 'package:pokemon/features/pokedex/presentation/cubit/pokedex_cubit.dart';
import 'package:pokemon/features/pokedex/presentation/screens/widgets/image_widget.dart';

class PokemonList extends StatelessWidget {
  const PokemonList(
      {super.key, required this.scrollController, required this.pokemonList});
  final ScrollController scrollController;
  final List<Result> pokemonList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController
          ..addListener(() {
            if (scrollController.offset ==
                scrollController.position.maxScrollExtent) {
              context.read<PokedexCubit>().getPokedexMore(10, 0);
            }
          }),
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImageWidget(index: index),
                  Text(pokemonList[index].nameEntity.capitalize()),
                  Text('${index + 1}'),
                ],
              ),
              const Divider(),
            ],
          );
        });
  }
}
