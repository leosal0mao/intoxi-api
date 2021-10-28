import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/endpoints/intoxi_anime_url.dart';
import 'core/http/http_adapter_impl.dart';
import 'modules/animes/bloc/anime_bloc.dart';
import 'modules/animes/data/anime_repository_impl.dart';
import 'modules/animes/view/animes_list_view.dart';
import 'modules/animes/view/sample_item_details_view.dart';
import 'modules/settings/settings_controller.dart';
import 'modules/settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => Dio()),
        RepositoryProvider(
            create: (context) =>
                HttpAdapterImpl(IntoxiAnimeUrl.restRoute, context.read<Dio>())),
        RepositoryProvider(
            create: (context) =>
                AnimeRepositoryImpl(client: context.read<HttpAdapterImpl>())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AnimeBloc(context.read<AnimeRepositoryImpl>())),
        ],
        child: AnimatedBuilder(
          animation: settingsController,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              restorationScopeId: 'app',
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
              ],
              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              themeMode: settingsController.themeMode,
              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) {
                    switch (routeSettings.name) {
                      case SettingsView.routeName:
                        return SettingsView(controller: settingsController);
                      case AnimeDetailsView.routeName:
                        return const AnimeDetailsView();
                      case AnimesListView.routeName:
                      default:
                        return AnimesListView();
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
