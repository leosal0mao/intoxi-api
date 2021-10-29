import 'package:flutter/material.dart';

import 'src/app_widget.dart';
import 'src/modules/settings/settings_controller.dart';
import 'src/modules/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(AppWidget(settingsController: settingsController));
}
