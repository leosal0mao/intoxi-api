import 'dart:convert';

import '../helpers/errors/errors.dart';
import '../models/models.dart';

import 'mappers.dart';

class AnimeMapper {
  Anime fromMap(Map<String, dynamic> map) {
    try {
      return Anime(
        id: map['id'],
        data: AnimeDataMapper.fromMap(map['data']),
      );
    } catch (e, stack) {
      throw AnimeMapperErrors(e.toString(), stack);
    }
  }

  Map toMap(Anime anime) {
    try {
      return {
        'id': anime.id,
        'data': AnimeDataMapper.toMap(anime.data),
      };
    } catch (e, stack) {
      throw AnimeMapperErrors(e.toString(), stack);
    }
  }

  Anime fromJson(String source) {
    try {
      return fromMap(json.decode(source));
    } catch (e, stack) {
      throw AnimeMapperErrors(e.toString(), stack);
    }
  }
}
