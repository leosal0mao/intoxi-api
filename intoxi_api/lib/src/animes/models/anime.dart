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
