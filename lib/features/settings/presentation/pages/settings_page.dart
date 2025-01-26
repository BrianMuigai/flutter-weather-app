import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/l10n/app_localization.dart';
import 'package:weather_app/features/settings/presentation/widgets/language_settings.dart';
import 'package:weather_app/features/settings/presentation/widgets/metrics_settings.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.getString(context, 'settings')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [LanguageSettings(), MetricsSettings()],
        ),
      ),
    );
  }
}
