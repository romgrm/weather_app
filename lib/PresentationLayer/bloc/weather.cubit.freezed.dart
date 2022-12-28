// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather.cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Map<String, Map<String, List<WeatherDayDto>>> weatherDays)
        onSuccess,
    required TResult Function(String errorMessage) onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            Map<String, Map<String, List<WeatherDayDto>>> weatherDays)?
        onSuccess,
    TResult? Function(String errorMessage)? onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<String, Map<String, List<WeatherDayDto>>> weatherDays)?
        onSuccess,
    TResult Function(String errorMessage)? onError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(OnSuccess value) onSuccess,
    required TResult Function(OnError value) onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(OnSuccess value)? onSuccess,
    TResult? Function(OnError value)? onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(OnSuccess value)? onSuccess,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'WeatherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Map<String, Map<String, List<WeatherDayDto>>> weatherDays)
        onSuccess,
    required TResult Function(String errorMessage) onError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            Map<String, Map<String, List<WeatherDayDto>>> weatherDays)?
        onSuccess,
    TResult? Function(String errorMessage)? onError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<String, Map<String, List<WeatherDayDto>>> weatherDays)?
        onSuccess,
    TResult Function(String errorMessage)? onError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(OnSuccess value) onSuccess,
    required TResult Function(OnError value) onError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(OnSuccess value)? onSuccess,
    TResult? Function(OnError value)? onError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(OnSuccess value)? onSuccess,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements WeatherState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$OnSuccessCopyWith<$Res> {
  factory _$$OnSuccessCopyWith(
          _$OnSuccess value, $Res Function(_$OnSuccess) then) =
      __$$OnSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, Map<String, List<WeatherDayDto>>> weatherDays});
}

/// @nodoc
class __$$OnSuccessCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$OnSuccess>
    implements _$$OnSuccessCopyWith<$Res> {
  __$$OnSuccessCopyWithImpl(
      _$OnSuccess _value, $Res Function(_$OnSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherDays = null,
  }) {
    return _then(_$OnSuccess(
      weatherDays: null == weatherDays
          ? _value._weatherDays
          : weatherDays // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, List<WeatherDayDto>>>,
    ));
  }
}

/// @nodoc

class _$OnSuccess implements OnSuccess {
  const _$OnSuccess(
      {required final Map<String, Map<String, List<WeatherDayDto>>>
          weatherDays})
      : _weatherDays = weatherDays;

  final Map<String, Map<String, List<WeatherDayDto>>> _weatherDays;
  @override
  Map<String, Map<String, List<WeatherDayDto>>> get weatherDays {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weatherDays);
  }

  @override
  String toString() {
    return 'WeatherState.onSuccess(weatherDays: $weatherDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSuccess &&
            const DeepCollectionEquality()
                .equals(other._weatherDays, _weatherDays));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_weatherDays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSuccessCopyWith<_$OnSuccess> get copyWith =>
      __$$OnSuccessCopyWithImpl<_$OnSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Map<String, Map<String, List<WeatherDayDto>>> weatherDays)
        onSuccess,
    required TResult Function(String errorMessage) onError,
  }) {
    return onSuccess(weatherDays);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            Map<String, Map<String, List<WeatherDayDto>>> weatherDays)?
        onSuccess,
    TResult? Function(String errorMessage)? onError,
  }) {
    return onSuccess?.call(weatherDays);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<String, Map<String, List<WeatherDayDto>>> weatherDays)?
        onSuccess,
    TResult Function(String errorMessage)? onError,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(weatherDays);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(OnSuccess value) onSuccess,
    required TResult Function(OnError value) onError,
  }) {
    return onSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(OnSuccess value)? onSuccess,
    TResult? Function(OnError value)? onError,
  }) {
    return onSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(OnSuccess value)? onSuccess,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(this);
    }
    return orElse();
  }
}

abstract class OnSuccess implements WeatherState {
  const factory OnSuccess(
      {required final Map<String, Map<String, List<WeatherDayDto>>>
          weatherDays}) = _$OnSuccess;

  Map<String, Map<String, List<WeatherDayDto>>> get weatherDays;
  @JsonKey(ignore: true)
  _$$OnSuccessCopyWith<_$OnSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnErrorCopyWith<$Res> {
  factory _$$OnErrorCopyWith(_$OnError value, $Res Function(_$OnError) then) =
      __$$OnErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$OnErrorCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$OnError>
    implements _$$OnErrorCopyWith<$Res> {
  __$$OnErrorCopyWithImpl(_$OnError _value, $Res Function(_$OnError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$OnError(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnError implements OnError {
  const _$OnError({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'WeatherState.onError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnError &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnErrorCopyWith<_$OnError> get copyWith =>
      __$$OnErrorCopyWithImpl<_$OnError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Map<String, Map<String, List<WeatherDayDto>>> weatherDays)
        onSuccess,
    required TResult Function(String errorMessage) onError,
  }) {
    return onError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            Map<String, Map<String, List<WeatherDayDto>>> weatherDays)?
        onSuccess,
    TResult? Function(String errorMessage)? onError,
  }) {
    return onError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<String, Map<String, List<WeatherDayDto>>> weatherDays)?
        onSuccess,
    TResult Function(String errorMessage)? onError,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(OnSuccess value) onSuccess,
    required TResult Function(OnError value) onError,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(OnSuccess value)? onSuccess,
    TResult? Function(OnError value)? onError,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(OnSuccess value)? onSuccess,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class OnError implements WeatherState {
  const factory OnError({required final String errorMessage}) = _$OnError;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$OnErrorCopyWith<_$OnError> get copyWith =>
      throw _privateConstructorUsedError;
}
