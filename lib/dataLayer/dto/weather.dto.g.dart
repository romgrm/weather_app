// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherDto _$$_WeatherDtoFromJson(Map<String, dynamic> json) =>
    _$_WeatherDto(
      id: json['id'] as int?,
      description: json['description'] as String?,
      iconId: json['iconId'] as String?,
    );

Map<String, dynamic> _$$_WeatherDtoToJson(_$_WeatherDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'iconId': instance.iconId,
    };
