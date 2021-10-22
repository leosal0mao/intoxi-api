import 'package:equatable/equatable.dart';

import 'anime_data.dart';
import 'models.dart';

class Anime extends Equatable {
  final int id;
  final AnimeData data;
  const Anime({
    required this.id,
    required this.data,
  });

  @override
  List<Object?> get props => [id, data];
}

class Anime2 {
  final int id;
  final AnimeData data;
  const Anime2({
    required this.id,
    required this.data,
  });
}

void main() {
  final anime = Anime(
      id: 1,
      data: AnimeData(
          ogDescription: '',
          ogImage: AnimeImage(url: "", width: 1, height: 1),
          ogTitle: ""));
  final anime2 = Anime(
      id: 2,
      data: AnimeData(
          ogDescription: '',
          ogImage: AnimeImage(url: "", width: 1, height: 1),
          ogTitle: ""));
  final anime3 = Anime2(
      id: 1,
      data: AnimeData(
          ogDescription: '',
          ogImage: AnimeImage(url: "", width: 1, height: 1),
          ogTitle: ""));
  final anime4 = Anime2(
      id: 1,
      data: AnimeData(
          ogDescription: '',
          ogImage: AnimeImage(url: "", width: 1, height: 1),
          ogTitle: ""));

  print(anime == anime2);
  print(anime3 == anime4);
  print(anime == anime4);
}
