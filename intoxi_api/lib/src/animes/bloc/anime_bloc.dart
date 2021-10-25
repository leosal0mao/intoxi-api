import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/anime_repository.dart';
import 'anime_event.dart';
import 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeRepository repository;

  AnimeBloc(this.repository) : super(AnimeStateInitial()) {
    on<AnimeFetched>((event, emit) async {
      emit(AnimeStateLoad());
      var response = await repository.fetchAnimes(event.params);
      response.fold((left) {
        emit(AnimeStateFailure(left.message));
      }, (right) {
        emit(AnimeStateSucess(animes: right));
      });
    });
  }
}
