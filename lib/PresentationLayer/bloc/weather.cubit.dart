import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../common/extensions/date.extension.dart';
import '../../core/rest/rest_exception.dart';
import '../../dataLayer/dto/weather_day.dto.dart';
import '../../dataLayer/repositories/weather.repository.dart';

part 'weather.cubit.freezed.dart';
part 'weather.state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(Loading());

  Future<void> getWeatherForFiveDays() async {
    Map<String, Map<String, List<WeatherDayDto>>> weatherDaysFiltered = {};
    DateTime date = DateTime.now();
    emit(const Loading());

    final weatherDays = await weatherRepository.getWeatherForFiveDays();

    if (weatherDays != null) {
      List<WeatherDayDto?> testWeahters = [];
      for (var i = 0; i < 5; i++) {
        testWeahters = weatherDays
            .map((element) {
              if ((element.dt_txt!.isSameDate(date))) {
                return element;
              }
            })
            .toList()
            .whereNotNull()
            .toList();

        weatherDaysFiltered.putIfAbsent("${DateFormat("yyyy-MM-dd").format(date)}", () => {"${DateFormat("yyyy-MM-dd").format(date)}": List.from(testWeahters)});
        date = date.add(Duration(days: 1));
      }
      print(weatherDaysFiltered);
      emit(OnSuccess(weatherDays: weatherDays)); //TODO change state return for weatherDaysFiltered
    } else {
      emit(OnError(errorMessage: RestException.restErrorUnauthorized));
    }
  }
}
