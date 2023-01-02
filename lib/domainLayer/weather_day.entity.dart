import 'package:weather_app/domainLayer/main_infos.entity.dart';
import 'package:weather_app/domainLayer/weather.entity.dart';

class WeatherDayEntity {
  DateTime? date;
  MainInfosEntity? infos;
  List<WeatherEntity>? weathers;
  WeatherDayEntity({
    this.date,
    this.infos,
    this.weathers,
  });
}
