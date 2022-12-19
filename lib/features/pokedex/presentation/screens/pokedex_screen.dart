import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokedex/domain/entities/pokedex.dart';
import 'package:pokemon/features/pokedex/presentation/cubit/pokedex_cubit.dart';

class PokedexSceen extends StatelessWidget {
  const PokedexSceen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: BlocBuilder<PokedexCubit, PokedexState>(
          builder: ((context, state) {
            return state.when(initial: () {
              return const SizedBox();
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            }, loaded: ((pokedex) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: pokedex.resultEntity.length,
                  itemBuilder: (context, index) {
                    Result pokedexList = pokedex.resultEntity[index];
                    return Column(
                      children: [
                        Text(pokedexList.nameEntity),
                        const Divider(),
                      ],
                    );
                  });
            }), error: (error) {
              return Center(
                child: Text(error, style: const TextStyle(color: Colors.red)),
              );
            });
          }),
        ));
  }
}
