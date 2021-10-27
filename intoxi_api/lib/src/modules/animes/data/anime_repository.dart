import 'package:intoxi_api/src/core/helpers/errors.dart';

import '../dtos/dtos.dart';
import '../models/models.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<Anime>>> fetchAnimes(AnimeDto params);
}
