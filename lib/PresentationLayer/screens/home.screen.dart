import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/common/widgets/customAppBar.widget.dart';
import 'package:weather_app/presentationLayer/bloc/authentication.cubit.dart';
import 'package:weather_app/presentationLayer/widgets/weather_card.widget.dart';

import '../../core/di/service_locator.dart';
import '../../dataLayer/datasources/weather.data.dart';
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
                  return ListView.builder(
                    itemBuilder: ((context, index) {
                      return Center(
                        child: Card(
                          color: Colors.red,
                          child: Column(
                            children: [
                              Text("${weatherDays.keys.toList()[index]}"),
                              for (var item in weatherDays.values.toList()[index].entries)
                                for (var weatherDay in item.value) WeatherCardWidget(weatherDayDto: weatherDay)
                              // Text("${weatherDay.weather?.first.description}")
                            ],
                          ),
                        ),
                      );
                    }),
                    itemCount: weatherDays.length,
                  );
                },
                onError: (errorMessage) => Text("error", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red)),
                loading: () => Center(child: Text("loading", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red))),
              );
              // return Container(
              //   child: Center(
              //       child: ElevatedButton(
              //           onPressed: () {
              //             // provider.getWeatherForFiveDays();
              //           },
              //           child: Text("test"))),
              // );
            },
          ),
        );
      },
    );
  }
}
