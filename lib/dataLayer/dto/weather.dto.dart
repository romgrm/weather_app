import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/domainLayer/weather.entity.dart';

part 'weather.dto.freezed.dart';
part 'weather.dto.g.dart';

@freezed
class WeatherDto with _$WeatherDto {
  const WeatherDto._();
  const factory WeatherDto({
    int? id,
    String? description,
    String? icon,
  }) = _WeatherDto;

  factory WeatherDto.fromJson(Map<String, Object?> json) => _$WeatherDtoFromJson(json);

  WeatherEntity toEntity() => WeatherEntity(description: description ?? "", icon: icon ?? "");
}
