import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../common/extensions/date.extension.dart';
import '../../common/extensions/string.extension.dart';
import '../../common/spacers/spacers.dart';
import '../../domainLayer/weather_day.entity.dart';
import '../../localize/localize.dart';
import '../../theme/colors.cubit.dart';

class WeatherInfosCardWidget extends StatelessWidget {
  final WeatherDayEntity weatherDayDto;

  const WeatherInfosCardWidget({super.key, required this.weatherDayDto});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spaceL),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: spaceM),
              child: Text(
                "${weatherDayDto.date?.toHourAndMinutes()}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20, color: context.read<ColorsCubit>().state.getPrimary()),
              ),
            ),
            for (var weather in weatherDayDto.weathers!)
              Column(
                children: [Image.network("http://openweathermap.org/img/wn/${weather.icon}@2x.png")],
              ),
            Text(
              "${weatherDayDto.infos?.temperature?.floor()}°",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20, color: context.read<ColorsCubit>().state.getPrimary()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: spaceM),
              child: Row(
                children: [
                  VariantTemp(weatherDayDto.infos?.maximumTemperature, true, context),
                  VariantTemp(weatherDayDto.infos?.minimalTemperature, false, context),
                ],
              ),
            ),
            for (var weather in weatherDayDto.weathers!)
              Padding(
                padding: const EdgeInsets.only(bottom: spaceM),
                child: Text("${weather.description?.capitalize()}"),
              ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(spaceM)),
              color: context.read<ColorsCubit>().state.getThirdly().withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(spaceM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(getLocalize("weatherInfosCardPerceivedTemperatureTitle"), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.only(top: spaceS),
                      child: Text(
                        "${weatherDayDto.infos?.perceivedTemperature?.floor()}°",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 30, color: context.read<ColorsCubit>().state.getPrimary()),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget VariantTemp(double? temp, bool isMax, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spaceS),
      child: Row(
        children: [
          isMax
              ? Icon(
                  MdiIcons.arrowUp,
                  color: Colors.white,
                )
              : Icon(
                  MdiIcons.arrowDown,
                  color: Colors.white,
                ),
          Text(
            "${temp?.floor()}°",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20, color: context.read<ColorsCubit>().state.getPrimary()),
          ),
        ],
      ),
    );
  }
}
