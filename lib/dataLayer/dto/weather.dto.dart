import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.dto.freezed.dart';
part 'weather.dto.g.dart';

@freezed
class WeatherDto with _$WeatherDto {
  const factory WeatherDto({
    int? id,
    String? description,
    String? iconId,
  }) = _WeatherDto;

  factory WeatherDto.fromJson(Map<String, Object?> json) => _$WeatherDtoFromJson(json);
}
