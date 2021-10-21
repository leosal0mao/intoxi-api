import 'package:flutter/material.dart';
import 'package:intoxi_api/src/animes/widgets/anime_tile.dart';

import '../../settings/settings_view.dart';
import '../models/models.dart';
import 'sample_item_details_view.dart';

class AnimesListView extends StatelessWidget {
  const AnimesListView({
    Key? key,
    this.animes,
  }) : super(key: key);

  static const routeName = '/';

  final List<Anime>? animes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Animes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: (animes == null)
          ? const Center(child: Text('Lista Vazia'))
          : ListView.builder(itemBuilder: (BuildContext context, int index) {
              return AnimeListTile(
                animeId: animes![index].id.toString(),
                animeImage: animes![index].data.ogImage.url,
                onTap: () {
                  Navigator.restorablePushNamed(
                    context,
                    SampleItemDetailsView.routeName,
                  );
                },
              );
            }),
    );
  }
}
