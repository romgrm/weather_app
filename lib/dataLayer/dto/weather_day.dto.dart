import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domainLayer/weather_day.entity.dart';
import 'main.dto.dart';
import 'weather.dto.dart';

part 'weather_day.dto.freezed.dart';
part 'weather_day.dto.g.dart';

@freezed
class WeatherDayDto with _$WeatherDayDto {
  const WeatherDayDto._();

  const factory WeatherDayDto({
    DateTime? dt_txt,
    MainDto? main,
    List<WeatherDto>? weather,
  }) = _WeatherDayDto;

  factory WeatherDayDto.fromJson(Map<String, Object?> json) => _$WeatherDayDtoFromJson(json);

  WeatherDayEntity toEntity() => WeatherDayEntity(date: dt_txt, infos: main?.toEntity(), weathers: weather?.map((e) => e.toEntity()).toList());
}
