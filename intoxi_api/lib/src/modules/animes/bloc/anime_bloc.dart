import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/http/errors/http_errors.dart';

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

    on<AnimePaginate>((event, emit) async {
      emit((state as AnimeStateSucess).copyWith(isLoading: true));

      var response = await repository.fetchAnimes(event.params);
      var paginateState = response.fold((left) {
        if (left is HttpError && left.statusCode == '400') {
          return ((state as AnimeStateSucess)
              .copyWith(hasReachedMax: true, isLoading: false));
        } else {
          return (AnimeStateFailure(left.message));
        }
      }, (right) {
        return (AnimeStateSucess(
            animes: (state as AnimeStateSucess).animes!..addAll(right),
            isLoading: false));
      });

      emit(AnimeStateLoad());
      emit(paginateState);
    });
  }
}
