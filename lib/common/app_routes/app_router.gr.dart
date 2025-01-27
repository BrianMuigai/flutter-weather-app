// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:weather_app/features/forecast/presentation/pages/forecast_page.dart'
    as _i1;
import 'package:weather_app/features/settings/presentation/pages/settings_page.dart'
    as _i3;
import 'package:weather_app/main_screen.dart' as _i2;

/// generated route for
/// [_i1.ForecastPage]
class ForecastRoute extends _i4.PageRouteInfo<void> {
  const ForecastRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ForecastRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForecastRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.ForecastPage();
    },
  );
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainScreen();
    },
  );
}

/// generated route for
/// [_i3.SettingsPage]
class SettingsRoute extends _i4.PageRouteInfo<void> {
  const SettingsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SettingsPage();
    },
  );
}
