import 'package:flutter/material.dart';

class AnimeListTile extends StatelessWidget {
  final String? animeId;
  final String? animeImage;
  final String? animeTitle;
  final VoidCallback? onTap;
  const AnimeListTile({
    Key? key,
    this.animeId,
    this.animeImage,
    this.onTap,
    this.animeTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text('Id: $animeId'),
        subtitle: Text('$animeTitle'),
        leading: CircleAvatar(
          child: Image.network(animeImage ?? '',
              errorBuilder: (context, value, stackTrace) {
            return const CircularProgressIndicator();
          }),
          // backgroundImage: NetworkImage('$animeImage!')
        ),
        onTap: onTap);
  }
}
