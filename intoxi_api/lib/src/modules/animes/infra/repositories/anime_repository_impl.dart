import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../../domain/dtos/anime_dto.dart';
import '../../domain/entities/anime.dart';
import '../../domain/repositories/anime_repository.dart';
import '../data_sources/anime_remote_datasource.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDatasource dataSource;

  AnimeRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Anime>>> fetchAnimes(
      {required AnimeDto params}) async {
    try {
      final response = await dataSource.getAll(queries: params.toMap());
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
