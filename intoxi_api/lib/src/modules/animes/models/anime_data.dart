import 'package:equatable/equatable.dart';

import 'anime_image.dart';

class AnimeData extends Equatable {
  final String ogTitle;
  final String ogDescription;
  final List<AnimeImage> ogImage;
  const AnimeData({
    required this.ogTitle,
    required this.ogDescription,
    required this.ogImage,
  });

  @override
  List<Object?> get props => [ogTitle, ogDescription, ogImage];
}
