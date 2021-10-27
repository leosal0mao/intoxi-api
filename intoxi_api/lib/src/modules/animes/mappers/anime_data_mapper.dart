import 'dart:convert';

import '../helpers/errors/errors.dart';
import '../models/models.dart';

import 'mappers.dart';

class AnimeDataMapper {
  static AnimeData fromMap(Map<String, dynamic> map) {
    try {
      return AnimeData(
        ogTitle: map['og_title'],
        ogDescription: map['og_description'],
        ogImage: AnimeImageMapper.fromListMap(
            (map['og_image'] as List).cast<Map<String, dynamic>>()),
      );
    } catch (e, stack) {
      throw AnimeDataMapperErrors(e.toString(), stack);
    }
  }

  static Map toMap(AnimeData animeDataModel) {
    try {
      return {
        'og_title': animeDataModel.ogTitle,
        'og_description': animeDataModel.ogDescription,
        'og_image': animeDataModel.ogImage
            .map((e) => AnimeImageMapper.toMap(e))
            .toList(),
      };
    } catch (e, stack) {
      throw AnimeDataMapperErrors(e.toString(), stack);
    }
  }

  static AnimeData fromJson(String source) {
    try {
      return AnimeDataMapper.fromMap(json.decode(source));
    } catch (e, stack) {
      throw AnimeDataMapperErrors(e.toString(), stack);
    }
  }
}