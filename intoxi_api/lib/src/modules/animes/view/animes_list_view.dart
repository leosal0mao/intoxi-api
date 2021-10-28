import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intoxi_api/src/modules/animes/widgets/bottom_loader_widget.dart';

import '../../settings/settings_view.dart';
import '../bloc/anime_bloc.dart';
import '../bloc/anime_event.dart';
import '../bloc/anime_state.dart';
import '../dtos/anime_dto.dart';
import '../models/models.dart';
import '../widgets/anime_tile.dart';

class AnimesListView extends StatefulWidget {
  AnimesListView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  State<AnimesListView> createState() => _AnimesListViewState();
}

class _AnimesListViewState extends State<AnimesListView> {
  final _scrollController = ScrollController();
  ValueNotifier<AnimeDto> params = ValueNotifier(const AnimeDto(1, 10));

  @override
  void initState() {
    super.initState();
    context.read<AnimeBloc>().add(AnimeFetched(params.value));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final state = context.read<AnimeBloc>().state;
    final page = params.value.page;
    if (_isBottom && state is AnimeStateSucess && !state.isLoading) {
      params.value = params.value.copyWith(page: page + 1);
      context.read<AnimeBloc>().add(AnimePaginate(params.value));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  buildBody(AnimeState state) {
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
        return state.animes!.isEmpty
            ? const Center(child: Text('Lista Vazia'))
            : ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.animes!.length
                    : state.animes!.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.animes!.length
                      ? const BottomLoaderWidget()
                      : AnimeListTile(
                          animeId: state.animes![index].id.toString(),
                          animeImage: state.animes![index].data.ogImage![0].url,
                          animeTitle: state.animes![index].data.ogTitle,
                        );
                });

      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AnimeBloc>();

    Widget body = buildBody(bloc.state);

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
      body: body,
    );
  }
}
