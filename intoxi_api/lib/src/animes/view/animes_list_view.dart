import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intoxi_api/src/animes/bloc/anime_bloc.dart';
import 'package:intoxi_api/src/animes/bloc/anime_event.dart';
import 'package:intoxi_api/src/animes/bloc/anime_state.dart';
import 'package:intoxi_api/src/animes/data/anime_repository_impl.dart';
import 'package:intoxi_api/src/animes/dtos/anime_dto.dart';
import 'package:intoxi_api/src/animes/widgets/anime_tile.dart';
import 'package:intoxi_api/src/core/endpoints/intoxi_anime_url.dart';
import 'package:intoxi_api/src/core/http/http_adapter_impl.dart';

import '../../settings/settings_view.dart';
import '../models/models.dart';
import 'sample_item_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimesListView extends StatelessWidget {
  AnimesListView({
    Key? key,
    this.animes,
    required this.controller,
  }) : super(key: key);

  static const routeName = '/';

  final StreamController<int> controller;
  final List<Anime>? animes;
  var counter = 0;
  final ValueNotifier<int> count2 = ValueNotifier<int>(0);

  increment() {
    count2.value = count2.value + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Animes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigator.restorablePushNamed(context, SettingsView.routeName);
              increment();
            },
          ),
        ],
      ),
      body: (animes == null)
          // ? const Center(child: Text('Lista Vazia'))
          ? BlocBuilder<AnimeBloc, AnimeState>(
              bloc: context.read<AnimeBloc>()
                ..add(AnimeFetched(const AnimeDto(1, 20))),
              builder: (context, state) {
                switch (state.runtimeType) {
                  case AnimeStateLoad:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case AnimeStateFailure:
                    state as AnimeStateFailure;
                    return Center(
                      child: Text(state.message),
                    );

                  case AnimeStateSucess:
                    state as AnimeStateSucess;
                    return Center(
                      child: Text(state.animes?.length.toString() ?? ''),
                    );

                  default:
                    return Container();
                }
              })
          // Center(
          //     child: ValueListenableBuilder<int>(
          //         valueListenable: count2,
          //         builder: (context, count, _) {
          //           return Text(count.toString());
          //         }))
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
