// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_day.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherDayDto _$$_WeatherDayDtoFromJson(Map<String, dynamic> json) =>
    _$_WeatherDayDto(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      temperature: (json['temperature'] as num?)?.toDouble(),
      minTemperature: (json['minTemperature'] as num?)?.toDouble(),
      maxTemperature: (json['maxTemperature'] as num?)?.toDouble(),
      temperatureFeels: (json['temperatureFeels'] as num?)?.toDouble(),
      weatherDto: json['weatherDto'] == null
          ? null
          : WeatherDto.fromJson(json['weatherDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WeatherDayDtoToJson(_$_WeatherDayDto instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'temperature': instance.temperature,
      'minTemperature': instance.minTemperature,
      'maxTemperature': instance.maxTemperature,
      'temperatureFeels': instance.temperatureFeels,
      'weatherDto': instance.weatherDto,
    };
