import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/debouncer.dart';
import 'package:weather_app/common/l10n/app_localization.dart';
import 'package:weather_app/common/weather_utils.dart';
import 'package:weather_app/features/forecast/data/models/current_weather.dart';
import 'package:weather_app/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:weather_app/features/forecast/presentation/widgets/min_current_max.dart';
import 'package:weather_app/features/forecast/presentation/widgets/retry.dart';

class Header extends StatefulWidget {
  final TextEditingController controller;
  const Header({super.key, required this.controller});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  CurrentWeather? currentWeather;

  void _fetch(BuildContext context, String value) {
    String city = value;
    if (city.isEmpty) city = 'nairobi';
    context.read<ForecastBloc>().add(FetchCurrentWeather(city: value));
    context.read<ForecastBloc>().add(FetchWeather(city: city));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForecastBloc, ForecastState>(
      listener: (context, state) {
        if (state is CurrentWeatherLoaded) {
          setState(() {
            currentWeather = state.weather;
          });
        }
      },
      child:
          BlocBuilder<ForecastBloc, ForecastState>(builder: (context, state) {
        return Column(
          children: [
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(24),
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: AppLocalizations.getString(context, 'city'),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none, // No border
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                ),
                onChanged: (value) {
                  debouncer.run(() => _fetch(context, value));
                },
              ),
            ),
            if (state is CurrentWeatherError) ...[
              const Spacer(),
              Retry(
                message: state.error,
                onRefresh: () {
                  String city = widget.controller.text;
                  if (city.isEmpty) city = 'nairobi';
                  context
                      .read<ForecastBloc>()
                      .add(FetchCurrentWeather(city: city));
                },
              )
            ] else if (currentWeather != null) ...[
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 3,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(
                        getIcon(currentWeather!.weather.first.main, true),
                      ),
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currentWeather!.main.feelsLike.toString(),
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                textAlign: TextAlign.center,
                              ),
                              Transform.translate(
                                offset: const Offset(0, -10),
                                child: Text(
                                  "°",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(fontSize: 42),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            currentWeather!.weather.first.description,
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.pin_drop),
                              const SizedBox(width: 10),
                              Text(currentWeather!.name),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              MinCurrentMax(
                tempCurrent: currentWeather!.main.temp,
                tempMin: currentWeather!.main.tempMin,
                tempMax: currentWeather!.main.tempMax,
              )
            ]
          ],
        );
      }),
    );
  }
}
