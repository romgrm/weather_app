import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/service_locator.dart';
import '../../dataLayer/datasources/weather.data.dart';
import '../bloc/weather.cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeatherForFiveDays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return state.when(
            onSuccess: (weatherDays) {
              // return Center(
              //   child: Text("success", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red)),
              // );
              return ListView.builder(
                itemBuilder: ((context, index) {
                  return Text(
                    "${weatherDays[index].main?.temp ?? ""}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red),
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
  }
}
