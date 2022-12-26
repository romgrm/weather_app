import 'package:weather_app/dataLayer/datasources/weather.data.dart';
import 'package:weather_app/dataLayer/dto/weather_day.dto.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  @override
  Future<List<WeatherDayDto>?> getWeatherForFiveDays() {
    // TODO: implement getWeatherForFiveDays
    throw UnimplementedError();
  }
}
