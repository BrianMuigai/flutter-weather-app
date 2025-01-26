import 'package:flutter/material.dart';
import 'package:weather_app/common/l10n/app_localization.dart';

class MinCurrentMax extends StatelessWidget {
  final double tempMin;
  final double tempCurrent;
  final double tempMax;

  const MinCurrentMax({
    super.key,
    required this.tempMin,
    required this.tempCurrent,
    required this.tempMax,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Aligns items across the row
          children: [
            // Min Column
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${tempMin.toInt()}°"),
                  Text(AppLocalizations.getString(context, "min")),
                ],
              ),
            ),
            // Current Column
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${tempCurrent.toInt()}°"),
                  Text(AppLocalizations.getString(context, "current")),
                ],
              ),
            ),
            // Max Column
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${tempMax.toInt()}°"),
                  Text(AppLocalizations.getString(context, "max")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
