import '../../core/di/service_locator.dart';
import '../../domainLayer/weather_day.entity.dart';
import '../datasources/weather_impl.data.dart';
import '../dto/weather_day.dto.dart';

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
