import 'package:dartz/dartz.dart';

import '../../core/helpers/errors.dart';
import '../../core/http/errors/http_errors.dart';
import '../../core/http/http_adapter.dart';
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
      final animesResponse = await client.get(headers: params.toMap());

      final animes = (animesResponse as List)
          .map((e) => AnimeMapper().fromJson(e))
          .toList();
      return Right(animes);
    } on HttpError catch (e) {
      return Left(e);
    } catch (e, stack) {
      return Left(AnimeRepositoryError(e.toString(), stack));
    }
  }
}
