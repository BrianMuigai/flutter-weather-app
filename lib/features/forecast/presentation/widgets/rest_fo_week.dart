import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/l10n/app_localization.dart';
import 'package:weather_app/common/weather_utils.dart';
import 'package:weather_app/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:weather_app/features/forecast/presentation/widgets/retry.dart';

class RestOfWeek extends StatefulWidget {
  final VoidCallback onRefresh;
  const RestOfWeek({super.key, required this.onRefresh});

  @override
  State<RestOfWeek> createState() => _RestOfWeekState();
}

class _RestOfWeekState extends State<RestOfWeek> {
  final List<ForecastHolder> days = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForecastBloc, ForecastState>(
      listener: (context, state) {
        if (state is ForecastLoaded) {
          setState(() {
            days.clear();
            days.addAll(state.viewHolders);
          });
        }
      },
      child:
          BlocBuilder<ForecastBloc, ForecastState>(builder: (context, state) {
        if (state is ForecastError) {
          return Retry(onRefresh: widget.onRefresh, message: state.error);
        } else if (state is ForecastLoading) {
          return Center(child: CircularProgressIndicator.adaptive());
        }
        if (days.isEmpty) {
          return Center(
            child: Text(AppLocalizations.getString(context, "noData")),
          );
        }
        return ListView.builder(
          itemCount: days.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      days[index].dayOfWeek,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Image(image: AssetImage(days[index].icon)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${days[index].avgTemp}°",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
