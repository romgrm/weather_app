import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/dataLayer/dto/weather_day.dto.dart';
import 'package:weather_app/dataLayer/repositories/weather.repository.dart';

import '../../core/rest/rest_exception.dart';
import '../../domainLayer/weather_day.entity.dart';

part 'weather.state.dart';
part 'weather.cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(Loading());

  Future<void> getWeatherForFiveDays() async {
    emit(const Loading());

    final weatherDays = await weatherRepository.getWeatherForFiveDays();

    if (weatherDays != null) {
      emit(OnSuccess(weatherDays: weatherDays));
    } else {
      emit(OnError(errorMessage: RestException.restErrorUnauthorized));
    }
  }
}
