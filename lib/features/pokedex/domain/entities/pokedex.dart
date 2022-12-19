import 'package:equatable/equatable.dart';

class Pokedex extends Equatable {
  const Pokedex(
    this.countEntity,
    this.nextEntity,
    this.previousEntity,
    this.resultEntity,
  );

  final int countEntity;
  final String nextEntity;
  final dynamic previousEntity;
  final List<Result> resultEntity;

  @override
  List<Object?> get props =>
      [countEntity, nextEntity, previousEntity, resultEntity];
}

class Result extends Equatable {
  const Result(
    this.nameEntity,
    this.urlEntity,
  );

  final String nameEntity;
  final String urlEntity;

  @override
  List<Object?> get props => [nameEntity, urlEntity];
}
