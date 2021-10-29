import 'package:flutter/material.dart';
import 'package:intoxi_api/src/routes/app_pages.dart';
import '../modules/animes/presenter/view/animes_list_view.dart';
import '../modules/animes/presenter/view/sample_item_details_view.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          // case SettingsView.routeName:
          //   return SettingsView(controller: settingsController);
          case AppPages.animeItemDescription:
            return const AnimeDetailsView();
          case AppPages.animeList:
          default:
            return const AnimesListView();
        }
      },
    );
  }
}
