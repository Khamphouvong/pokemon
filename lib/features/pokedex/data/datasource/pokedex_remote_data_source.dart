import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/core/configs/DI/config_dependencies.dart';
import 'package:pokemon/core/errors/exceptions.dart';
import 'package:pokemon/core/localization/generated/l10n.dart';
import 'package:pokemon/core/services/api_client.dart';
import 'package:pokemon/core/utils/response_helper.dart';
import 'package:pokemon/features/pokedex/data/models/pokedex_model.dart';

abstract class PokedexRemoteDataSource {
  Future<PokedexModel> getPokedex(int limit, int offset);
}

@LazySingleton(as: PokedexRemoteDataSource)
class PokedexRemoteDataSourceImpl implements PokedexRemoteDataSource {
  final ApiClient apiClient;
  PokedexRemoteDataSourceImpl(this.apiClient);

  @override
  Future<PokedexModel> getPokedex(int limit, int offset) async {
    try {
      return await apiClient.getPokedex(limit, offset);
    } on DioError catch (e) {
      throw ResponseHelper.returnResponse(e);
    } catch (e) {
      throw ServerException(getIt<I10n>().counterAppBarTitle);
    }
  }
}
