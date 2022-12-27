import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/utils/string_extension.dart';
import 'package:pokemon/features/pokedex/domain/entities/pokedex.dart';
import 'package:pokemon/features/pokedex/presentation/cubit/pokedex_cubit.dart';
import 'package:pokemon/features/pokedex/presentation/screens/widgets/image_widget.dart';

class PokemonList extends StatelessWidget {
  const PokemonList(
      {super.key,
      required this.scrollController,
      required this.pokemonList,
      this.loading});
  final ScrollController scrollController;
  final List<Result> pokemonList;
  final Widget? loading;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //add scroll controller when scroll max then read Pokedex Cubit
      controller: scrollController
        ..addListener(() {
          double maxScroll = scrollController.position.maxScrollExtent;
          double currentScroll = scrollController.position.pixels;
          double delta = MediaQuery.of(context).size.height * 0.20;
          if (maxScroll - currentScroll <= delta) {
            context.read<PokedexCubit>().getPokedexMore(10, 0);
          }
        }),
      slivers: [
        const SliverAppBar(
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: pokemonList.length,
          (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ImageWidget(index: index),
                    Text(
                      pokemonList[index].nameEntity.capitalize(),
                      textAlign: TextAlign.start,
                    ),
                    Text('${index + 1}'),
                  ],
                ),
                const Divider(),
              ],
            );
          },
        )),

        //if Scroll is max run loading widget
        loading ?? const SliverToBoxAdapter(child: SizedBox())
      ],
    );
  }
}
