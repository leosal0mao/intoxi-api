import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/anime_repository.dart';

abstract class FetchAnimeUsecase {
  Future<Either<Failure, List<Anime>>> call({required AnimeDto params});
}

class FetchAnimesUsecaseImpl implements FetchAnimeUsecase {
  final AnimeRepository repository;

  FetchAnimesUsecaseImpl({required this.repository});
  @override
  Future<Either<Failure, List<Anime>>> call({required AnimeDto params}) {
    return repository.fetchAnimes(params: params);
  }
}
