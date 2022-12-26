// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_day.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherDayDto _$WeatherDayDtoFromJson(Map<String, dynamic> json) {
  return _WeatherDayDto.fromJson(json);
}

/// @nodoc
mixin _$WeatherDayDto {
  DateTime? get date => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  double? get minTemperature => throw _privateConstructorUsedError;
  double? get maxTemperature => throw _privateConstructorUsedError;
  double? get temperatureFeels => throw _privateConstructorUsedError;
  WeatherDto? get weatherDto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDayDtoCopyWith<WeatherDayDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDayDtoCopyWith<$Res> {
  factory $WeatherDayDtoCopyWith(
          WeatherDayDto value, $Res Function(WeatherDayDto) then) =
      _$WeatherDayDtoCopyWithImpl<$Res, WeatherDayDto>;
  @useResult
  $Res call(
      {DateTime? date,
      double? temperature,
      double? minTemperature,
      double? maxTemperature,
      double? temperatureFeels,
      WeatherDto? weatherDto});

  $WeatherDtoCopyWith<$Res>? get weatherDto;
}

/// @nodoc
class _$WeatherDayDtoCopyWithImpl<$Res, $Val extends WeatherDayDto>
    implements $WeatherDayDtoCopyWith<$Res> {
  _$WeatherDayDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? temperature = freezed,
    Object? minTemperature = freezed,
    Object? maxTemperature = freezed,
    Object? temperatureFeels = freezed,
    Object? weatherDto = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      minTemperature: freezed == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      maxTemperature: freezed == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureFeels: freezed == temperatureFeels
          ? _value.temperatureFeels
          : temperatureFeels // ignore: cast_nullable_to_non_nullable
              as double?,
      weatherDto: freezed == weatherDto
          ? _value.weatherDto
          : weatherDto // ignore: cast_nullable_to_non_nullable
              as WeatherDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherDtoCopyWith<$Res>? get weatherDto {
    if (_value.weatherDto == null) {
      return null;
    }

    return $WeatherDtoCopyWith<$Res>(_value.weatherDto!, (value) {
      return _then(_value.copyWith(weatherDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherDayDtoCopyWith<$Res>
    implements $WeatherDayDtoCopyWith<$Res> {
  factory _$$_WeatherDayDtoCopyWith(
          _$_WeatherDayDto value, $Res Function(_$_WeatherDayDto) then) =
      __$$_WeatherDayDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? date,
      double? temperature,
      double? minTemperature,
      double? maxTemperature,
      double? temperatureFeels,
      WeatherDto? weatherDto});

  @override
  $WeatherDtoCopyWith<$Res>? get weatherDto;
}

/// @nodoc
class __$$_WeatherDayDtoCopyWithImpl<$Res>
    extends _$WeatherDayDtoCopyWithImpl<$Res, _$_WeatherDayDto>
    implements _$$_WeatherDayDtoCopyWith<$Res> {
  __$$_WeatherDayDtoCopyWithImpl(
      _$_WeatherDayDto _value, $Res Function(_$_WeatherDayDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? temperature = freezed,
    Object? minTemperature = freezed,
    Object? maxTemperature = freezed,
    Object? temperatureFeels = freezed,
    Object? weatherDto = freezed,
  }) {
    return _then(_$_WeatherDayDto(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      minTemperature: freezed == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      maxTemperature: freezed == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureFeels: freezed == temperatureFeels
          ? _value.temperatureFeels
          : temperatureFeels // ignore: cast_nullable_to_non_nullable
              as double?,
      weatherDto: freezed == weatherDto
          ? _value.weatherDto
          : weatherDto // ignore: cast_nullable_to_non_nullable
              as WeatherDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherDayDto extends _WeatherDayDto {
  const _$_WeatherDayDto(
      {this.date,
      this.temperature,
      this.minTemperature,
      this.maxTemperature,
      this.temperatureFeels,
      this.weatherDto})
      : super._();

  factory _$_WeatherDayDto.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherDayDtoFromJson(json);

  @override
  final DateTime? date;
  @override
  final double? temperature;
  @override
  final double? minTemperature;
  @override
  final double? maxTemperature;
  @override
  final double? temperatureFeels;
  @override
  final WeatherDto? weatherDto;

  @override
  String toString() {
    return 'WeatherDayDto(date: $date, temperature: $temperature, minTemperature: $minTemperature, maxTemperature: $maxTemperature, temperatureFeels: $temperatureFeels, weatherDto: $weatherDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherDayDto &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.minTemperature, minTemperature) ||
                other.minTemperature == minTemperature) &&
            (identical(other.maxTemperature, maxTemperature) ||
                other.maxTemperature == maxTemperature) &&
            (identical(other.temperatureFeels, temperatureFeels) ||
                other.temperatureFeels == temperatureFeels) &&
            (identical(other.weatherDto, weatherDto) ||
                other.weatherDto == weatherDto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, temperature,
      minTemperature, maxTemperature, temperatureFeels, weatherDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherDayDtoCopyWith<_$_WeatherDayDto> get copyWith =>
      __$$_WeatherDayDtoCopyWithImpl<_$_WeatherDayDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherDayDtoToJson(
      this,
    );
  }
}

abstract class _WeatherDayDto extends WeatherDayDto {
  const factory _WeatherDayDto(
      {final DateTime? date,
      final double? temperature,
      final double? minTemperature,
      final double? maxTemperature,
      final double? temperatureFeels,
      final WeatherDto? weatherDto}) = _$_WeatherDayDto;
  const _WeatherDayDto._() : super._();

  factory _WeatherDayDto.fromJson(Map<String, dynamic> json) =
      _$_WeatherDayDto.fromJson;

  @override
  DateTime? get date;
  @override
  double? get temperature;
  @override
  double? get minTemperature;
  @override
  double? get maxTemperature;
  @override
  double? get temperatureFeels;
  @override
  WeatherDto? get weatherDto;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherDayDtoCopyWith<_$_WeatherDayDto> get copyWith =>
      throw _privateConstructorUsedError;
}
