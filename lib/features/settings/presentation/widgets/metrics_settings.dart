import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/l10n/app_localization.dart';
import 'package:weather_app/features/settings/presentation/bloc/settings_bloc.dart';

class MetricsSettings extends StatelessWidget {
  const MetricsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBloc = context.read<SettingsBloc>();
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      String uom = settingsBloc.getMetrics();
      if (state is ChangeUnitOfMeasurementSuccess) {
        uom = settingsBloc.getMetrics();
      }
      return Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.getString(context, "uom"),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            DropdownButton<String>(
              value: uom,
              items: [
                DropdownMenuItem(
                  value: "standard",
                  child: Text(AppLocalizations.getString(context, 'standard')),
                ),
                DropdownMenuItem(
                  value: "metric",
                  child: Text(AppLocalizations.getString(context, 'metric')),
                ),
                DropdownMenuItem(
                  value: "imperial",
                  child: Text(AppLocalizations.getString(context, 'imperial')),
                ),
              ],
              onChanged: (uom) {
                if (uom != null) {
                  context
                      .read<SettingsBloc>()
                      .add(ChangeUnitOfMeasurement(uom: uom));
                }
              },
            ),
          ],
        ),
      ));
    });
  }
}
