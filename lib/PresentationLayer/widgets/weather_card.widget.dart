import 'package:flutter/material.dart';
import 'package:weather_app/dataLayer/dto/weather_day.dto.dart';
import 'package:weather_app/domainLayer/weather_day.entity.dart';
import 'package:weather_app/common/extensions/date.extension.dart';

class WeatherCardWidget extends StatefulWidget {
  final WeatherDayEntity weatherDayDto;
  const WeatherCardWidget({super.key, required this.weatherDayDto});

  @override
  State<WeatherCardWidget> createState() => _WeatherCardWidgetState();
}

class _WeatherCardWidgetState extends State<WeatherCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${widget.weatherDayDto.date?.toHourAndMinutes()}"),
        Text("${widget.weatherDayDto.infos?.temperature}"),
        for (var weather in widget.weatherDayDto.weathers!)
          Column(
            children: [Text("${weather.description}"), Image.network("http://openweathermap.org/img/wn/${weather.icon}@2x.png")],
          ),
      ],
    );
  }
}
