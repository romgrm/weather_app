import 'package:weather_app/dataLayer/datasources/weather_impl.data.dart';
import 'package:weather_app/dataLayer/dto/weather_day.dto.dart';

import '../../core/di/service_locator.dart';
import '../../domainLayer/weather_day.entity.dart';

class WeatherRepository {
  final provider = getIt<WeatherDataSourceImpl>();

  Future<List<WeatherDayEntity>?> getWeatherForFiveDays() async {
    final List<WeatherDayDto>? weatherDaysDto = await provider.getWeatherForFiveDays();

    if (weatherDaysDto != null) {
      return List<WeatherDayEntity>.from(weatherDaysDto.map((weatherDayDto) => weatherDayDto.toEntity()));
    } else {
      return null;
    }
  }
}
