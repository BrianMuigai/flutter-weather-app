import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/l10n/app_localization.dart';
import 'package:weather_app/common/l10n/locale_provider.dart';
import 'package:weather_app/features/settings/presentation/bloc/settings_bloc.dart';

class LanguageSettings extends StatelessWidget {
  const LanguageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final currentLocale = provider.locale;
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is ChangeLanguageSuccess) {
          provider.setLocale(Locale(state.langCode));
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
            if (state is ChangeLanguageError) {
              Column(
                children: [
                  Text(state.error),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      context
                          .read<SettingsBloc>()
                          .add(ChangeLanguage(langCode: state.langCode));
                    },
                    child: Text(AppLocalizations.getString(context, 'retry')),
                  )
                ],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.getString(context, "app_language"),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                DropdownButton<Locale>(
                  value: currentLocale,
                  items: [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child:
                          Text(AppLocalizations.getString(context, 'english')),
                    ),
                    DropdownMenuItem(
                      value: Locale('fr'),
                      child:
                          Text(AppLocalizations.getString(context, 'french')),
                    ),
                    DropdownMenuItem(
                      value: Locale('es'),
                      child:
                          Text(AppLocalizations.getString(context, 'spanish')),
                    ),
                  ],
                  onChanged: (locale) {
                    if (locale != null) {
                      context
                          .read<SettingsBloc>()
                          .add(ChangeLanguage(langCode: locale.languageCode));
                    }
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
