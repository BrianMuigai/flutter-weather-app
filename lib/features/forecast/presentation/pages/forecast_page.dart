import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:weather_app/features/forecast/presentation/widgets/header.dart';
import 'package:weather_app/features/forecast/presentation/widgets/rest_fo_week.dart';

@RoutePage()
class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final _cityController = TextEditingController(text: 'nairobi');

  @override
  void initState() {
    super.initState();
    context
        .read<ForecastBloc>()
        .add(FetchCurrentWeather(city: _cityController.text));
    context.read<ForecastBloc>().add(FetchWeather(city: _cityController.text));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Header(controller: _cityController)),
            const SizedBox(height: 20),
            Expanded(
              child: RestOfWeek(onRefresh: () {
                context
                    .read<ForecastBloc>()
                    .add(FetchWeather(city: _cityController.text));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
