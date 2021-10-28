import '../helpers/errors/errors.dart';
import '../models/models.dart';

import 'mappers.dart';

class AnimeMapper {
  Anime fromMap(Map<String, dynamic> map) {
    try {
      return Anime(
        id: map['id'],
        data: AnimeDataMapper.fromMap(map['yoast_head_json']),
      );
    } catch (e, stack) {
      throw AnimeMapperErrors(e.toString(), stack);
    }
  }

  List<Anime> fromListMap({required List<Map<String, dynamic>> maps}) {
    try {
      return maps.map((map) => fromMap(map)).toList();
    } catch (e, stack) {
      throw AnimeImageMapperErrors(e.toString(), stack);
    }
  }
}
