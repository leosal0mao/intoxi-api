import 'package:equatable/equatable.dart';
import 'package:intoxi_api/src/animes/dtos/anime_dto.dart';

abstract class AnimeEvent extends Equatable {}

class AnimeFetched extends AnimeEvent {
  final AnimeDto params;

  AnimeFetched(this.params);

  @override
  List<Object> get props => [params];
}
