import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/core/constants/api_path.dart';
import 'package:pokemon/features/pokedex/data/models/pokedex_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiPaht.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(ApiPaht.pokedex)
  Future<PokedexModel> getPokedex(
    @Query(ApiPaht.limit) int limit,
    @Query(ApiPaht.offset) int offset,
  );
}
