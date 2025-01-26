import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/app_routes/app_router.gr.dart';
import 'package:weather_app/common/l10n/app_localization.dart';
import 'package:weather_app/core/di/injector.dart';
import 'package:weather_app/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:weather_app/features/settings/presentation/bloc/settings_bloc.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ForecastBloc>()),
        BlocProvider(create: (context) => getIt<SettingsBloc>())
      ],
      child: AutoTabsScaffold(
          lazyLoad: false,
          routes: const [ForecastRoute(), SettingsRoute()],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.dashboard),
                  label: AppLocalizations.getString(context, 'forecast'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.account_circle),
                  label: AppLocalizations.getString(context, 'settings'),
                ),
              ],
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: Colors.blue,
              onTap: tabsRouter.setActiveIndex,
            );
          }),
    );
  }
}
