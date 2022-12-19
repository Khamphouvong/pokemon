import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/configs/DI/config_dependencies.dart';
import 'package:pokemon/features/pokedex/presentation/cubit/pokedex_cubit.dart';
import 'package:pokemon/features/pokedex/presentation/screens/pokedex_screen.dart';

class AppRoute {
  static const String initialRoute = "/";
  static Route<dynamic>? routeGenerate(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PokedexCubit>()..getPokedex(10, 0),
            child: const PokedexSceen(),
          ),
        );
      default:
        return null;
    }
  }
}
