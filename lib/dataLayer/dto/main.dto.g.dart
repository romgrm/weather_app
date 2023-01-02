// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MainDto _$$_MainDtoFromJson(Map<String, dynamic> json) => _$_MainDto(
      temp: (json['temp'] as num?)?.toDouble(),
      feels_like: (json['feels_like'] as num?)?.toDouble(),
      temp_min: (json['temp_min'] as num?)?.toDouble(),
      temp_max: (json['temp_max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_MainDtoToJson(_$_MainDto instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
    };
