part of 'weather.cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.loading() = Loading;
  const factory WeatherState.onSuccess({required Map<DateTime, Map<String, List<WeatherDayEntity>>> weatherDays}) = OnSuccess;
  const factory WeatherState.onError({required String errorMessage}) = OnError;
}
