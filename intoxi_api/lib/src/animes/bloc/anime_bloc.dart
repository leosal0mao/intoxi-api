import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intoxi_api/src/animes/bloc/anime_state.dart';
import 'package:intoxi_api/src/animes/bloc/anime_event.dart';
import 'package:intoxi_api/src/animes/data/anime_repository.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeRepository repository;

  AnimeBloc(this.repository) : super(const AnimeState());
}
