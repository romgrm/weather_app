import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/di/service_locator.dart';
import 'package:weather_app/dataLayer/repositories/authentication.repository.dart';
import 'package:weather_app/presentationLayer/bloc/authentication.cubit.dart';
import 'package:weather_app/presentationLayer/bloc/weather.cubit.dart';
import 'package:weather_app/presentationLayer/screens/home.screen.dart';
import 'package:weather_app/theme/colors.cubit.dart';

import 'Theme/app.theme.dart';
import 'dataLayer/repositories/weather.repository.dart';
import 'presentationLayer/screens/authentication.screen.dart';

void main() {
  setUpGetIt();
  runApp(const AppProviders());
}

class AppProviders extends StatefulWidget {
  const AppProviders({super.key});

  @override
  State<AppProviders> createState() => _AppProvidersState();
}

class _AppProvidersState extends State<AppProviders> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthenticationRepository(),
        ),
        RepositoryProvider(
          create: (context) => WeatherRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ColorsCubit()),
          BlocProvider(create: (context) => AuthenticationCubit(context.read<AuthenticationRepository>())),
          BlocProvider(create: (context) => WeatherCubit(context.read<WeatherRepository>())),
        ],
        child: const App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  late Brightness _brightness;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    _updateTheme();
  }

  @override
  void didChangePlatformBrightness() {
    _updateTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _updateTheme() {
    _brightness = SchedulerBinding.instance.window.platformBrightness;

    context.read<ColorsCubit>().update(_brightness);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/home": (context) => HomeScreen()},
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: HomeScreen(),
    );
  }
}
