import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/http/errors/http_errors.dart';
import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/fetch_animes_usecase.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final FetchAnimeUsecase usecase;

  AnimeBloc({required this.usecase}) : super(AnimeStateInitial()) {
    on<AnimeFetched>((event, emit) async {
      emit(AnimeStateLoad());
      var response = await usecase(params: event.params);
      response.fold((left) {
        emit(AnimeStateFailure(left.message));
      }, (right) {
        emit(AnimeStateSucess(animes: right));
      });
    });

    on<AnimePaginate>((event, emit) async {
      emit((state as AnimeStateSucess).copyWith(isLoading: true));

      var response = await usecase(params: event.params);
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
