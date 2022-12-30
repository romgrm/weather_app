import '../../core/rest/restManager.dart';
import '../dto/weather_day.dto.dart';
import 'weather.data.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  RestManager restManager;
  WeatherDataSourceImpl(
    this.restManager,
  );
  @override
  Future<List<WeatherDayDto>?> getWeatherForFiveDays() async {
    List<WeatherDayDto> weatherDays = [];
    final params = {"id": 2968815, "appid": "b212ee35da614193703096d6d6644c3c", "units": "metric", "lang": "fr"};

    final json = await restManager.get(path: "https://api.openweathermap.org/data/2.5/forecast?", parameters: params);
    weatherDays = List<WeatherDayDto>.from(json['list'].map((json) {
      return WeatherDayDto.fromJson(json);
    }));

    return weatherDays;
  }
}
