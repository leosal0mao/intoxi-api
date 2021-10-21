import 'package:equatable/equatable.dart';
import 'package:intoxi_api/src/animes/models/anime.dart';

enum AnimeStatus { initial, success, failure }

class AnimeState extends Equatable {
  final AnimeStatus? status;
  final List<Anime>? animes;
  final bool? hasReachedMax;

  const AnimeState({
    this.status = AnimeStatus.initial,
    this.animes = const <Anime>[],
    this.hasReachedMax = false,
  });

  AnimeState copyWith({
    AnimeStatus? status,
    List<Anime>? animes,
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
