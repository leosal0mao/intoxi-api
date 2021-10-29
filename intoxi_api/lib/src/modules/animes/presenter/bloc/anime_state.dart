part of 'anime_bloc.dart';

abstract class AnimeState extends Equatable {}

class AnimeStateFailure extends AnimeState {
  final String message;

  AnimeStateFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class AnimeStateSucess extends AnimeState {
  final List<Anime>? animes;
  final bool hasReachedMax;
  final bool isLoading;

  AnimeStateSucess({
    required this.animes,
    this.hasReachedMax = false,
    this.isLoading = false,
  });

  AnimeStateSucess copyWith({
    List<Anime>? animes,
    bool? hasReachedMax,
    bool? isLoading,
  }) {
    return AnimeStateSucess(
      animes: animes ?? this.animes,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoading: isLoading ?? this.isLoading,
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
