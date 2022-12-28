part of 'weather.cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.loading() = Loading;
  const factory WeatherState.onSuccess({required Map<String, Map<String, List<WeatherDayDto>>> weatherDays}) = OnSuccess;
  const factory WeatherState.onError({required String errorMessage}) = OnError;
}
