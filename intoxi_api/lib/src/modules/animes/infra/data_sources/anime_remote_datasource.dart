import '../../domain/entities/entities.dart';

abstract class AnimeRemoteDatasource {
  Future<List<Anime>> getAll({required Map<String, dynamic> queries});
}
