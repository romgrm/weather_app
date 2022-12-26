import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/rest/restManager.dart';
import 'package:weather_app/dataLayer/datasources/weather_impl.data.dart';
import 'package:weather_app/dataLayer/dto/weather_day.dto.dart';

class DioClientMock extends Mock implements RestManager {}

late DioClientMock _mockDioClient;
late WeatherDataSourceImpl _weatherDataSource;

void setUp() {
  _mockDioClient = DioClientMock();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp();

  test(
    "should return a List of WeatherDay",
    () async {
      // arrange
      final params = {"id": 2968815, "appid": "b212ee35da614193703096d6d6644c3c", "units": "metric", "lang": "fr"};

      when(
        () => _mockDioClient.get(path: "https://api.openweathermap.org/data/2.5/forecast?", parameters: params),
      ).thenAnswer((_) async => Future.value([WeatherDayDto()]));

      _weatherDataSource = WeatherDataSourceImpl(_mockDioClient);

      // act
      final result = await _weatherDataSource.getWeatherForFiveDays();
      // assert
      expect(result, isA<List<WeatherDayDto>>());
    },
  );
}
