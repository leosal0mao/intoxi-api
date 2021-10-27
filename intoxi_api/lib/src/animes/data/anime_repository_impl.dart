import 'package:dartz/dartz.dart';
import 'package:intoxi_api/src/core/endpoints/intoxi_anime_url.dart';

import '../../core/helpers/errors.dart';
import '../../core/http/errors/http_errors.dart';
import '../../core/http/http_adapter.dart';
import '../dtos/dtos.dart';
import '../mappers/mappers.dart';
import '../models/models.dart';
import 'anime_repository.dart';
import 'errors/anime_repository_error.dart';

import 'package:http/http.dart' as http;

class AnimeRepositoryImpl implements AnimeRepository {
  final HttpAdapter client;

  AnimeRepositoryImpl({
    required this.client,
  });

  // @override
  // Future<Either<Failure, List<Anime>>> fetchAnimes(AnimeDto params) async {
  //   try {
  //     // final animesResponse = await client.get(headers: params.toMap());
  //     final animesResponse = await http.get(Uri.parse(IntoxiAnimeUrl.restRoute),
  //         headers: params.toMap());

  //     final animes = (animesResponse.body as List<Anime>)
  //         .map((e) => AnimeMapper().fromJson(e.toString()))
  //         .toList().cast();

  //     return Right(animes);
  //   } on HttpError catch (e) {
  //     return Left(e);
  //   } catch (e, stack) {
  //     return Left(AnimeRepositoryError(
  //       message: e.toString(),
  //       stackTrace: stack,
  //     ));
  //   }
  // }
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
      return Left(AnimeRepositoryError(
        message: e.toString(),
        stackTrace: stack,
      ));
    }
  }
}
