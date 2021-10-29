import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intoxi_api/src/routes/app_routes.dart';

import 'core/helpers/endpoints/intoxi_anime_url.dart';
import 'core/http/http_adapter_impl.dart';
import 'modules/animes/domain/usecases/fetch_animes_usecase.dart';
import 'modules/animes/external/datasources/anime_remote_datasource_impl.dart';
import 'modules/animes/infra/repositories/anime_repository_impl.dart';
import 'modules/animes/presenter/bloc/anime_bloc.dart';
import 'modules/settings/settings_controller.dart';

/// The Widget that configures your application.
class AppWidget extends StatelessWidget {
  const AppWidget({
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
            create: (context) => AnimeRemoteDatasourceImpl(
                client: context.read<HttpAdapterImpl>())),
        RepositoryProvider(
            create: (context) => AnimeRepositoryImpl(
                dataSource: context.read<AnimeRemoteDatasourceImpl>())),
        RepositoryProvider(
            create: (context) => FetchAnimesUsecaseImpl(
                repository: context.read<AnimeRepositoryImpl>())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AnimeBloc(usecase: context.read<FetchAnimesUsecaseImpl>())),
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
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
