import 'package:auto_route/auto_route.dart';
import 'package:weather_app/common/app_routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true, children: [
          AutoRoute(page: ForecastRoute.page),
          AutoRoute(page: SettingsRoute.page)
        ])
      ];
}
