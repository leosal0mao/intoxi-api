import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intoxi_api/src/animes/bloc/anime_bloc.dart';
import 'package:intoxi_api/src/animes/bloc/anime_event.dart';
import 'package:intoxi_api/src/animes/bloc/anime_state.dart';
import 'package:intoxi_api/src/animes/dtos/anime_dto.dart';
import 'package:intoxi_api/src/animes/widgets/anime_tile.dart';

import '../../settings/settings_view.dart';
import '../models/models.dart';
import 'sample_item_details_view.dart';

class AnimesListView extends StatelessWidget {
  AnimesListView({
    Key? key,
    required this.controller,
    this.animes,
    this.animes2,
  }) : super(key: key);

  static const routeName = '/';

  final StreamController<int> controller;
  final List<Anime>? animes;
  var counter = 0;
  List<Anime>? animes2 = [
    Anime(
        id: 1,
        data: AnimeData(
            ogTitle: 'test',
            ogDescription: 'test',
            ogImage: AnimeImage(
              height: 10,
              width: 10,
              url: '',
            )))
  ];

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
        body: BlocBuilder<AnimeBloc, AnimeState>(
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
                  return ListView.builder(
                      itemCount: state.animes!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimeListTile(
                          animeId: state.animes![index].id.toString(),
                          animeImage: state.animes![index].data.ogImage.url,
                          animeTitle: state.animes![index].data.ogTitle,
                          onTap: () {
                            Navigator.restorablePushNamed(
                              context,
                              AnimeDetailsView.routeName,
                            );
                          },
                        );
                      });

                default:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
              }
            }));
    // body: (animes == null || animes!.isEmpty)
    //     ? const Center(child: Text('Lista Vazia'))
    //     : BlocBuilder<AnimeBloc, AnimeState>(
    //         bloc: context.read<AnimeBloc>()
    //           ..add(AnimeFetched(const AnimeDto(1, 20))),
    //         builder: (context, state) {
    //           switch (state.runtimeType) {
    //             case AnimeStateLoad:
    //               return const Center(
    //                 child: CircularProgressIndicator(),
    //               );
    //             case AnimeStateFailure:
    //               state as AnimeStateFailure;
    //               return Center(
    //                 child: Text(state.message),
    //               );

    //             case AnimeStateSucess:
    //               state as AnimeStateSucess;
    //               return ListView.builder(
    //                   itemBuilder: (BuildContext context, int index) {
    //                 return AnimeListTile(
    //                   animeId: state.animes![index].id.toString(),
    //                   animeImage: state.animes![index].data.ogImage.url,
    //                   animeTitle: state.animes![index].data.ogTitle,
    //                   onTap: () {
    //                     Navigator.restorablePushNamed(
    //                       context,
    //                       AnimeDetailsView.routeName,
    //                     );
    //                   },
    //                 );
    //               });

    //             default:
    //               return const Center(
    //                 child: CircularProgressIndicator(),
    //               );
    //           }
    //         }));
  }
}
