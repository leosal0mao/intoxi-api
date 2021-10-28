import 'package:dartz/dartz.dart';

import 'package:intoxi_api/src/core/helpers/errors.dart';
import 'package:intoxi_api/src/core/http/errors/http_errors.dart';
import 'package:intoxi_api/src/core/http/http_adapter.dart';
import '../dtos/dtos.dart';
import '../mappers/mappers.dart';
import '../models/models.dart';
import 'anime_repository.dart';
import 'errors/anime_repository_error.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final HttpAdapter client;

  AnimeRepositoryImpl({
    required this.client,
  });

  @override
  Future<Either<Failure, List<Anime>>> fetchAnimes(AnimeDto params) async {
    try {
      final animesResponse = await client.get(queries: params.toMap());

      // if (animesResponse.statusCode == '400') {
      //   return left(AnimeRepositoryError(
      //     message: 'Erro na listagem',
      //     stackTrace: StackTrace.current,
      //   ));
      // }

      final animes = (animesResponse.data as List).cast<Map<String, dynamic>>();

      return Right(AnimeMapper().fromListMap(maps: animes));
    } on HttpError catch (e) {
      return Left(e);
    } catch (e, stack) {
      return Left(AnimeRepositoryError(
        message: e.toString(),
        stackTrace: stack,
      ));
    }
  }
}
