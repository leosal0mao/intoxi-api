import 'dart:convert';

import '../helpers/errors/errors.dart';
import '../models/models.dart';

class AnimeImageMapper {
  static AnimeImage fromMap(Map<String, dynamic> map) {
    try {
      return AnimeImage(
        width: map['width'],
        height: map['height'],
        url: map['url'],
      );
    } catch (e, stack) {
      throw AnimeImageMapperErrors(e.toString(), stack);
    }
  }

  static Map toMap(AnimeImage animeImageModel) {
    try {
      return {
        'width': animeImageModel.width,
        'height': animeImageModel.height,
        'url': animeImageModel.url,
      };
    } catch (e, stack) {
      throw AnimeImageMapperErrors(e.toString(), stack);
    }
  }

  static AnimeImage fromJson(String source) {
    try {
      return AnimeImageMapper.fromMap(json.decode(source));
    } catch (e, stack) {
      throw AnimeImageMapperErrors(e.toString(), stack);
    }
  }

  static List<AnimeImage> fromListMap(List<Map<String, dynamic>> maps) {
    try {
      return maps.map((map) => fromMap(map)).toList();
    } catch (e, stack) {
      throw AnimeImageMapperErrors(e.toString(), stack);
    }
  }
}
