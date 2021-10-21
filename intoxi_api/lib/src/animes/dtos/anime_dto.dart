class AnimeDto {
  final int page;
  final int itemsPerPage;

  AnimeDto(this.page, this.itemsPerPage);

  Map<String, String> toMap() => {
        'page': page.toString(),
        'per_page': itemsPerPage.toString(),
      };
}
