import 'package:equatable/equatable.dart';

class AnimeImage extends Equatable {
  final double width;
  final double height;
  final String url;
  const AnimeImage({
    required this.width,
    required this.height,
    required this.url,
  });

  @override
  List<Object?> get props => [width, height, url];
}
