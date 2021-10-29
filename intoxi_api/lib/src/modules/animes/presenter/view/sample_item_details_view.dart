import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView({Key? key, this.animeDescription}) : super(key: key);
  final String? animeDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do anime'),
      ),
      body: Center(
        child: Text("$animeDescription!"),
      ),
    );
  }
}
