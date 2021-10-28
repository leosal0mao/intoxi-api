import 'package:equatable/equatable.dart';

class AnimeDto extends Equatable {
  final int page;
  final int itemsPerPage;

  const AnimeDto(this.page, this.itemsPerPage);

  AnimeDto copyWith({int? page, int? itemsPerPage}) {
    return AnimeDto(
      page ?? this.page,
      itemsPerPage ?? this.itemsPerPage,
    );
  }

  Map<String, String> toMap() => {
        'page': page.toString(),
        'per_page': itemsPerPage.toString(),
      };

  @override
  List<Object?> get props => [page, itemsPerPage];
}
