import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/localize/localize.dart';
import 'package:weather_app/presentationLayer/bloc/weather.cubit.dart';

import '../../common/spacers/spacers.dart';

class ErrorHandleWidget extends StatelessWidget {
  const ErrorHandleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<WeatherCubit>().getWeatherForFiveDays(),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: spaceXL),
            child: Icon(
              MdiIcons.refresh,
              color: Colors.white,
              size: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spaceL, vertical: spaceL),
            child: Text(
              getLocalize("weatherErrorHandleLabel"),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
