import 'package:intoxi_api/src/animes/models/anime_model.dart';

import 'package:http/http.dart' as http;

abstract class AnimeProvider {
  Future<List<AnimeModel>> fetchAnimes() async {}
}
