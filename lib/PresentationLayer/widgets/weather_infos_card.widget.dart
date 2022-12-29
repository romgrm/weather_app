import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/dataLayer/dto/weather_day.dto.dart';
import 'package:weather_app/domainLayer/weather_day.entity.dart';
import 'package:weather_app/common/extensions/date.extension.dart';
import 'package:weather_app/common/extensions/string.extension.dart';
import 'package:weather_app/theme/colors.cubit.dart';

import '../../common/spacers/spacers.dart';
import '../../localize/localize.dart';

class WeatherInfosCardWidget extends StatefulWidget {
  final WeatherDayEntity weatherDayDto;
  const WeatherInfosCardWidget({super.key, required this.weatherDayDto});

  @override
  State<WeatherInfosCardWidget> createState() => _WeatherInfosCardWidgetState();
}

class _WeatherInfosCardWidgetState extends State<WeatherInfosCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spaceL),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: spaceM),
              child: Text(
                "${widget.weatherDayDto.date?.toHourAndMinutes()}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20, color: context.read<ColorsCubit>().state.getPrimary()),
              ),
            ),
            for (var weather in widget.weatherDayDto.weathers!)
              Column(
                children: [Image.network("http://openweathermap.org/img/wn/${weather.icon}@2x.png")],
              ),
            Text(
              "${widget.weatherDayDto.infos?.temperature?.floor()}°",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20, color: context.read<ColorsCubit>().state.getPrimary()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: spaceM),
              child: Row(
                children: [
                  variantTemp(widget.weatherDayDto.infos?.maximumTemperature, true),
                  variantTemp(widget.weatherDayDto.infos?.minimalTemperature, false),
                ],
              ),
            ),
            // Row(
            //   children: [
            //     Icon(MdiIcons.arrowUp),
            //     Text(
            //       "${widget.weatherDayDto.infos?.maximumTemperature?.floor()}°",
            //       style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20, color: context.read<ColorsCubit>().state.getPrimary()),
            //     ),
            //   ],
            // ),
            for (var weather in widget.weatherDayDto.weathers!)
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
                        "${widget.weatherDayDto.infos?.perceivedTemperature?.floor()}°",
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

  Widget variantTemp(double? temp, bool isMax) {
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
