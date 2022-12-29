import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/dataLayer/dto/weather_day.dto.dart';
import 'package:weather_app/domainLayer/weather_day.entity.dart';
import 'package:weather_app/common/extensions/date.extension.dart';

import '../../localize/localize.dart';

class GlobalWeatherCard extends StatelessWidget {
  final WeatherDayEntity weatherDayDto;
  const GlobalWeatherCard({Key? key, required this.weatherDayDto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getLocalize("weatherGlobalCardLocationTitle"),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w100, fontSize: 50, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          "${weatherDayDto.infos?.temperature?.floor()}°",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w100, fontSize: 50, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          "${weatherDayDto.weathers?.first.description}°",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w100, fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
