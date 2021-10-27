import 'package:equatable/equatable.dart';
import '../models/models.dart';

abstract class AnimeState extends Equatable {}

class AnimeStateFailure extends AnimeState {
  final String message;

  AnimeStateFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class AnimeStateSucess extends AnimeState {
  final List<Anime>? animes;
  final bool? hasReachedMax;

  AnimeStateSucess({
    required this.animes,
    this.hasReachedMax = false,
  });

  AnimeStateSucess copyWith({
    List<Anime>? animes,
    bool? hasReachedMax,
  }) {
    return AnimeStateSucess(
      animes: animes ?? this.animes,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [animes, hasReachedMax];
}

class AnimeStateLoad extends AnimeState {
  @override
  List<Object?> get props => [];
}

class AnimeStateInitial extends AnimeState {
  @override
  List<Object?> get props => [];
}
