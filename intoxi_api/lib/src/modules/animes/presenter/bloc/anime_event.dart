part of 'anime_bloc.dart';

abstract class AnimeEvent extends Equatable {}

class AnimeFetched extends AnimeEvent {
  final AnimeDto params;

  AnimeFetched(this.params);

  @override
  List<Object> get props => [params];
}

class AnimePaginate extends AnimeEvent {
  final AnimeDto params;

  AnimePaginate(this.params);

  @override
  List<Object> get props => [params];
}
