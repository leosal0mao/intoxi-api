import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../dtos/dtos.dart';
import '../entities/entities.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<Anime>>> fetchAnimes({required AnimeDto params});
}
