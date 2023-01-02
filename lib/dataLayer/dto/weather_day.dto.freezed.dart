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
  DateTime? get dt_txt => throw _privateConstructorUsedError;
  MainDto? get main => throw _privateConstructorUsedError;
  List<WeatherDto>? get weather => throw _privateConstructorUsedError;

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
  $Res call({DateTime? dt_txt, MainDto? main, List<WeatherDto>? weather});

  $MainDtoCopyWith<$Res>? get main;
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
    Object? dt_txt = freezed,
    Object? main = freezed,
    Object? weather = freezed,
  }) {
    return _then(_value.copyWith(
      dt_txt: freezed == dt_txt
          ? _value.dt_txt
          : dt_txt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainDto?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherDto>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainDtoCopyWith<$Res>? get main {
    if (_value.main == null) {
      return null;
    }

    return $MainDtoCopyWith<$Res>(_value.main!, (value) {
      return _then(_value.copyWith(main: value) as $Val);
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
  $Res call({DateTime? dt_txt, MainDto? main, List<WeatherDto>? weather});

  @override
  $MainDtoCopyWith<$Res>? get main;
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
    Object? dt_txt = freezed,
    Object? main = freezed,
    Object? weather = freezed,
  }) {
    return _then(_$_WeatherDayDto(
      dt_txt: freezed == dt_txt
          ? _value.dt_txt
          : dt_txt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainDto?,
      weather: freezed == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherDayDto extends _WeatherDayDto {
  const _$_WeatherDayDto(
      {this.dt_txt, this.main, final List<WeatherDto>? weather})
      : _weather = weather,
        super._();

  factory _$_WeatherDayDto.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherDayDtoFromJson(json);

  @override
  final DateTime? dt_txt;
  @override
  final MainDto? main;
  final List<WeatherDto>? _weather;
  @override
  List<WeatherDto>? get weather {
    final value = _weather;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WeatherDayDto(dt_txt: $dt_txt, main: $main, weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherDayDto &&
            (identical(other.dt_txt, dt_txt) || other.dt_txt == dt_txt) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._weather, _weather));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dt_txt, main, const DeepCollectionEquality().hash(_weather));

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
      {final DateTime? dt_txt,
      final MainDto? main,
      final List<WeatherDto>? weather}) = _$_WeatherDayDto;
  const _WeatherDayDto._() : super._();

  factory _WeatherDayDto.fromJson(Map<String, dynamic> json) =
      _$_WeatherDayDto.fromJson;

  @override
  DateTime? get dt_txt;
  @override
  MainDto? get main;
  @override
  List<WeatherDto>? get weather;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherDayDtoCopyWith<_$_WeatherDayDto> get copyWith =>
      throw _privateConstructorUsedError;
}
