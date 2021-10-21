import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intoxi_api/src/animes/data/anime_provider.dart';
import 'package:intoxi_api/src/animes/models/anime_model.dart';

import 'package:http/http.dart' as http;

class AnimeRepository {
  final AnimeProvider? animeProvider;

  AnimeRepository({
    @required this.animeProvider,
  });

  static const baseUrl = 'https://www.intoxianime.com/?rest_route=/wp/v2';

  Future<List<AnimeModel>> fetchAnimes(int page, int itemsPerPage) async {
    final animesUrl =
        Uri.parse('$baseUrl/posts&page=$page&per_page=$itemsPerPage');
    final animesResponse = await http.get(animesUrl);

    if (animesResponse.statusCode != 200) {
      throw Exception("I'm sorry, I wasn't able to find anything.");
    }
    final animesJson = jsonDecode(animesResponse.body) as List;
    final consolidatedAnimes = animesJson as Map<String, dynamic>;
    if (animesJson.isEmpty) {
      throw Exception("Oops, there's no data here, I'm really sorry!");
    }
    final animes = AnimeModel.fromJson(consolidatedAnimes);
    return animes;
  }
}
