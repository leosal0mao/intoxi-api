import '../../domain/entities/entities.dart';

import '../helpers/errors/errors.dart';

import 'mappers.dart';

class AnimeMapper {
  AnimeMapper._(); // construtor privado

  static Anime fromMap(Map<String, dynamic> map) {
    try {
      return Anime(
        id: map['id'],
        data: AnimeDataMapper.fromMap(map['yoast_head_json']),
      );
    } catch (e, stack) {
      throw AnimeMapperErrors(e.toString(), stack);
    }
  }

  static List<Anime> fromListMap({required List<Map<String, dynamic>> maps}) {
    try {
      return maps.map((map) => fromMap(map)).toList();
    } catch (e, stack) {
      throw AnimeImageMapperErrors(e.toString(), stack);
    }
  }
}
