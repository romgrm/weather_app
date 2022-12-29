import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/common/extensions/date.extension.dart';
import 'package:weather_app/common/extensions/string.extension.dart';
import 'package:weather_app/common/spacers/spacers.dart';
import 'package:weather_app/common/widgets/customAppBar.widget.dart';
import 'package:weather_app/presentationLayer/bloc/authentication.cubit.dart';
import 'package:weather_app/presentationLayer/widgets/global_weather_card.widget.dart';
import 'package:weather_app/presentationLayer/widgets/weather_infos_card.widget.dart';

import '../../core/di/service_locator.dart';
import '../../dataLayer/datasources/weather.data.dart';
import '../../localize/localize.dart';
import '../../theme/colors.cubit.dart';
import '../bloc/weather.cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "";
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeatherForFiveDays();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: getCustomAppBar(
            context,
            withBackButton: false,
            titleWidget: Center(
                child: Text("Bonjour John", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: context.read<ColorsCubit>().state.getPrimary(), fontSize: 25, fontWeight: FontWeight.w100))),
            // titleWidget: state.whenOrNull(onSuccess: (user) => Center(child: Text("hello ${user.firstName}"))),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: spaceS),
                child: Icon(
                  MdiIcons.cog,
                  color: context.read<ColorsCubit>().state.getPrimary(),
                ),
              )
            ],
          ),
          body: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return state.when(
                onSuccess: (weatherDays) {
                  return Swiper(
                      layout: SwiperLayout.DEFAULT,
                      loop: false,
                      itemBuilder: (context, index) {
                        return Container(
                            // margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            // // elevation: 5,
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                            color: context.read<ColorsCubit>().state.getThirdly(),
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: spaceXXL),
                                    child: index == 0
                                        ? GlobalWeatherCard(weatherDayDto: weatherDays.values.toList()[0].entries.first.value.first)
                                        // display the 4th value (at 12h00) for global day
                                        : GlobalWeatherCard(weatherDayDto: weatherDays.values.toList()[index].entries.first.value[4]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: spaceM),
                                    child: Text(
                                      "${weatherDays.keys.toList()[index].toDayMonthAndYear().capitalize()}",
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20, fontWeight: FontWeight.w100, color: Colors.white),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: spaceL),
                                      child: Card(
                                        margin: EdgeInsets.symmetric(horizontal: spaceS, vertical: spaceXL),
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(spaceS)),
                                        color: context.read<ColorsCubit>().state.getThirdly().withOpacity(0.8),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: spaceS),
                                          child: ListView(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              for (var weathers in weatherDays.values.toList()[index].entries)
                                                for (var weatherDay in weathers.value) WeatherInfosCardWidget(weatherDayDto: weatherDay),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                      itemCount: weatherDays.length,
                      pagination: SwiperPagination(alignment: Alignment.bottomCenter, margin: EdgeInsets.all(spaceL)));
                },
                onError: (errorMessage) => Text("error", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red)),
                loading: () => Center(child: Text("loading", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red))),
              );
            },
          ),
        );
      },
    );
  }
}
