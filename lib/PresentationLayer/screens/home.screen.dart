import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/extensions/date.extension.dart';
import 'package:weather_app/common/spacers/spacers.dart';
import 'package:weather_app/common/widgets/customAppBar.widget.dart';
import 'package:weather_app/presentationLayer/bloc/authentication.cubit.dart';
import 'package:weather_app/presentationLayer/widgets/global_weather_card.widget.dart';
import 'package:weather_app/presentationLayer/widgets/weather_card.widget.dart';

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
            titleWidget: state.whenOrNull(onSuccess: (user) => Center(child: Text("hello ${user.firstName}"))),
            // actions: [Icon(MdiIcons.close), Center(child: Text("test", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: context.read<ColorsCubit>().state.getPrimary())))],
          ),
          body: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return state.when(
                onSuccess: (weatherDays) {
                  return Swiper(
                      layout: SwiperLayout.DEFAULT,
                      loop: false,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(spaceS)),
                              color: context.read<ColorsCubit>().state.getThirdly(),
                              child: Padding(
                                padding: const EdgeInsets.all(spaceXXL),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: spaceL),
                                        child: GlobalWeatherCard(weatherDayDto: weatherDays.values.toList()[index].entries.first.value.first),
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Card(
                                              color: context.read<ColorsCubit>().state.getThirdly().withOpacity(0.3),
                                              child: Row(
                                                children: [
                                                  for (var weathers in weatherDays.values.toList()[index].entries)
                                                    for (var weatherDay in weathers.value) WeatherCardWidget(weatherDayDto: weatherDay),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        );
                      },
                      itemCount: weatherDays.length,
                      pagination: SwiperPagination(alignment: Alignment.bottomCenter));
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
