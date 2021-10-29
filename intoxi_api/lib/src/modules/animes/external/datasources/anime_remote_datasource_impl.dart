import '../../../../core/helpers/errors/datasource_error.dart';
import '../../../../core/helpers/errors/failure.dart';
import '../../../../core/http/http_adapter.dart';
import '../../domain/entities/anime.dart';
import '../../infra/data_sources/anime_remote_datasource.dart';
import '../mappers/mappers.dart';

class AnimeRemoteDatasourceImpl implements AnimeRemoteDatasource {
  final HttpAdapter client;

  AnimeRemoteDatasourceImpl({required this.client});

  @override
  Future<List<Anime>> getAll({required Map<String, dynamic> queries}) async {
    try {
      final response = await client.get(queries: queries);

      final data = (response.data as List).cast<Map<String, dynamic>>();

      return AnimeMapper.fromListMap(maps: data);
    } on Failure {
      rethrow;
    } catch (e, stack) {
      throw DatasourceError(message: e.toString(), stackTrace: stack);
    }
  }
}
