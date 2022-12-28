import '../dto/weather_day.dto.dart';

abstract class WeatherDataSource {
  Future<List<WeatherDayDto>?> getWeatherForFiveDays();
}
