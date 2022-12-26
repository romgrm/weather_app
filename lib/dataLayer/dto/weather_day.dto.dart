import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/dataLayer/dto/weather.dto.dart';

part 'weather_day.dto.freezed.dart';
part 'weather_day.dto.g.dart';

@freezed
class WeatherDayDto with _$WeatherDayDto {
  const WeatherDayDto._();

  const factory WeatherDayDto({
    DateTime? date,
    double? temperature,
    double? minTemperature,
    double? maxTemperature,
    double? temperatureFeels,
    WeatherDto? weatherDto,
  }) = _WeatherDayDto;

  factory WeatherDayDto.fromJson(Map<String, Object?> json) => _$WeatherDayDtoFromJson(json);

  // UserEntity toEntity() => UserEntity(id: id, firstName: firstName, lastName: lastName);
}
