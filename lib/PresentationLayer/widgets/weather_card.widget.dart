import 'package:flutter/material.dart';
import 'package:weather_app/dataLayer/dto/weather_day.dto.dart';

class WeatherCardWidget extends StatefulWidget {
  final WeatherDayDto weatherDayDto;
  const WeatherCardWidget({super.key, required this.weatherDayDto});

  @override
  State<WeatherCardWidget> createState() => _WeatherCardWidgetState();
}

class _WeatherCardWidgetState extends State<WeatherCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${widget.weatherDayDto.dt_txt}"),
        Text("${widget.weatherDayDto.main?.temp}"),
        for (var weather in widget.weatherDayDto.weather!)
          Column(
            children: [Text("${weather.description}"), Image.network("http://openweathermap.org/img/wn/${weather.icon}@2x.png")],
          ),
      ],
    );
  }
}
