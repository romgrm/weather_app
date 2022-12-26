part of 'weather.cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.loading() = Loading;
  const factory WeatherState.onSuccess({required List<WeatherDayDto> weatherDays}) = OnSuccess;
  const factory WeatherState.onError({required String errorMessage}) = OnError;
}
