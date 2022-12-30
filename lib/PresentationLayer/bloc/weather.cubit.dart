import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domainLayer/weather_day.entity.dart';

import '../../common/extensions/date.extension.dart';
import '../../core/rest/rest_exception.dart';
import '../../dataLayer/dto/weather_day.dto.dart';
import '../../dataLayer/repositories/weather.repository.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

part 'weather.cubit.freezed.dart';
part 'weather.state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(Loading());

  Future<void> getWeatherForFiveDays() async {
    Map<DateTime, Map<String, List<WeatherDayEntity>>> weatherDaysFiltered = {};
    DateTime date = DateTime.now();
    emit(const Loading());

    try {
      final weatherDays = await weatherRepository.getWeatherForFiveDays();

      if (weatherDays != null) {
        tz.Location timezoneLocation;
        timezoneLocation = tz.getLocation("Europe/Paris");

        List<WeatherDayEntity?> testWeahters = [];
        for (var i = 0; i < 5; i++) {
          testWeahters = weatherDays
              .map((element) {
                if ((element.date!.isSameDate(date))) {
                  element.date = TZDateTime.from(element.date!, timezoneLocation);
                  return element;
                }
              })
              .toList()
              .whereNotNull()
              .toList();

          weatherDaysFiltered.putIfAbsent(date, () => {"${DateFormat("yyyy-MM-dd").format(date)}": List.from(testWeahters)});
          date = date.add(Duration(days: 1));
        }
        emit(OnSuccess(weatherDays: weatherDaysFiltered));
      } else {
        emit(OnError(errorMessage: RestException.restErrorUnauthorized));
      }
    } on RestException catch (error) {
      emit(OnError(errorMessage: error.message));
    }
  }
}
