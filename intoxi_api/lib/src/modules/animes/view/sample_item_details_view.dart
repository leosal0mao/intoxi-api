import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView({Key? key}) : super(key: key);

  static const routeName = '/anime_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do anime'),
      ),
      body: const Center(
        child: Text('Text'),
      ),
    );
  }
}
