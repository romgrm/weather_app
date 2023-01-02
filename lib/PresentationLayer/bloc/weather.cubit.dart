import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

import '../../common/extensions/date.extension.dart';
import '../../core/rest/rest_exception.dart';
import '../../dataLayer/repositories/weather.repository.dart';
import '../../domainLayer/weather_day.entity.dart';

part 'weather.cubit.freezed.dart';
part 'weather.state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(Loading());

  Future<void> getWeatherForFiveDays() async {
    Map<DateTime, Map<String, List<WeatherDayEntity>>> weatherDaysMap = {};
    DateTime currentDate = DateTime.now();
    emit(const Loading());

    try {
      final weatherDays = await weatherRepository.getWeatherForFiveDays();

      if (weatherDays != null) {
        tz.Location timezoneLocation;
        timezoneLocation = tz.getLocation("Europe/Paris");

        List<WeatherDayEntity?> weatherDaysFiltered = [];
        for (var i = 0; i < 5; i++) {
          weatherDaysFiltered = weatherDays
              .map((element) {
                if ((element.date!.isSameDate(currentDate))) {
                  element.date = TZDateTime.from(element.date!, timezoneLocation);
                  return element;
                }
              })
              .toList()
              .whereNotNull()
              .toList();

          weatherDaysMap.putIfAbsent(currentDate, () => {"${DateFormat("yyyy-MM-dd").format(currentDate)}": List.from(weatherDaysFiltered)});
          currentDate = currentDate.add(Duration(days: 1));
        }
        emit(OnSuccess(weatherDays: weatherDaysMap));
      } else {
        emit(OnError(errorMessage: RestException.restErrorUnauthorized));
      }
    } on RestException catch (error) {
      emit(OnError(errorMessage: error.message));
    }
  }
}
