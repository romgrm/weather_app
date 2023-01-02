// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MainDto _$MainDtoFromJson(Map<String, dynamic> json) {
  return _MainDto.fromJson(json);
}

/// @nodoc
mixin _$MainDto {
  double? get temp => throw _privateConstructorUsedError;
  double? get feels_like => throw _privateConstructorUsedError;
  double? get temp_min => throw _privateConstructorUsedError;
  double? get temp_max => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainDtoCopyWith<MainDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainDtoCopyWith<$Res> {
  factory $MainDtoCopyWith(MainDto value, $Res Function(MainDto) then) =
      _$MainDtoCopyWithImpl<$Res, MainDto>;
  @useResult
  $Res call(
      {double? temp, double? feels_like, double? temp_min, double? temp_max});
}

/// @nodoc
class _$MainDtoCopyWithImpl<$Res, $Val extends MainDto>
    implements $MainDtoCopyWith<$Res> {
  _$MainDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
    Object? feels_like = freezed,
    Object? temp_min = freezed,
    Object? temp_max = freezed,
  }) {
    return _then(_value.copyWith(
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
      feels_like: freezed == feels_like
          ? _value.feels_like
          : feels_like // ignore: cast_nullable_to_non_nullable
              as double?,
      temp_min: freezed == temp_min
          ? _value.temp_min
          : temp_min // ignore: cast_nullable_to_non_nullable
              as double?,
      temp_max: freezed == temp_max
          ? _value.temp_max
          : temp_max // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainDtoCopyWith<$Res> implements $MainDtoCopyWith<$Res> {
  factory _$$_MainDtoCopyWith(
          _$_MainDto value, $Res Function(_$_MainDto) then) =
      __$$_MainDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? temp, double? feels_like, double? temp_min, double? temp_max});
}

/// @nodoc
class __$$_MainDtoCopyWithImpl<$Res>
    extends _$MainDtoCopyWithImpl<$Res, _$_MainDto>
    implements _$$_MainDtoCopyWith<$Res> {
  __$$_MainDtoCopyWithImpl(_$_MainDto _value, $Res Function(_$_MainDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
    Object? feels_like = freezed,
    Object? temp_min = freezed,
    Object? temp_max = freezed,
  }) {
    return _then(_$_MainDto(
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
      feels_like: freezed == feels_like
          ? _value.feels_like
          : feels_like // ignore: cast_nullable_to_non_nullable
              as double?,
      temp_min: freezed == temp_min
          ? _value.temp_min
          : temp_min // ignore: cast_nullable_to_non_nullable
              as double?,
      temp_max: freezed == temp_max
          ? _value.temp_max
          : temp_max // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MainDto extends _MainDto {
  const _$_MainDto({this.temp, this.feels_like, this.temp_min, this.temp_max})
      : super._();

  factory _$_MainDto.fromJson(Map<String, dynamic> json) =>
      _$$_MainDtoFromJson(json);

  @override
  final double? temp;
  @override
  final double? feels_like;
  @override
  final double? temp_min;
  @override
  final double? temp_max;

  @override
  String toString() {
    return 'MainDto(temp: $temp, feels_like: $feels_like, temp_min: $temp_min, temp_max: $temp_max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainDto &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.feels_like, feels_like) ||
                other.feels_like == feels_like) &&
            (identical(other.temp_min, temp_min) ||
                other.temp_min == temp_min) &&
            (identical(other.temp_max, temp_max) ||
                other.temp_max == temp_max));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, temp, feels_like, temp_min, temp_max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainDtoCopyWith<_$_MainDto> get copyWith =>
      __$$_MainDtoCopyWithImpl<_$_MainDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MainDtoToJson(
      this,
    );
  }
}

abstract class _MainDto extends MainDto {
  const factory _MainDto(
      {final double? temp,
      final double? feels_like,
      final double? temp_min,
      final double? temp_max}) = _$_MainDto;
  const _MainDto._() : super._();

  factory _MainDto.fromJson(Map<String, dynamic> json) = _$_MainDto.fromJson;

  @override
  double? get temp;
  @override
  double? get feels_like;
  @override
  double? get temp_min;
  @override
  double? get temp_max;
  @override
  @JsonKey(ignore: true)
  _$$_MainDtoCopyWith<_$_MainDto> get copyWith =>
      throw _privateConstructorUsedError;
}
