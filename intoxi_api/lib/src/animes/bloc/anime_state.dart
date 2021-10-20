import 'package:equatable/equatable.dart';
import 'package:intoxi_api/src/animes/models/anime_model.dart';

enum AnimeStatus { initial, success, failure }

class AnimeState extends Equatable {
  final AnimeStatus? status;
  final List<AnimeModel>? animes;
  final bool? hasReachedMax;

  const AnimeState({
    this.status = AnimeStatus.initial,
    this.animes = const <AnimeModel>[],
    this.hasReachedMax = false,
  });

  AnimeState copyWith({
    AnimeStatus? status,
    List<AnimeModel>? animes,
    bool? hasReachedMax,
  }) {
    return AnimeState(
      status: status ?? this.status,
      animes: animes ?? this.animes,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''AnimeState { status: $status, hasReachedMax: $hasReachedMax, posts: ${animes?.length} }''';
  }

  @override
  List<Object?> get props => [status, animes, hasReachedMax];
}
