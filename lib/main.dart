import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'Theme/app.theme.dart';
import 'core/di/service_locator.dart';
import 'core/storage/storage.manager.dart';
import 'dataLayer/repositories/authentication.repository.dart';
import 'dataLayer/repositories/weather.repository.dart';
import 'presentationLayer/bloc/authentication.cubit.dart';
import 'presentationLayer/bloc/weather.cubit.dart';
import 'presentationLayer/screens/authentication.screen.dart';
import 'presentationLayer/screens/weather.screen.dart';
import 'theme/colors.cubit.dart';

void main() {
  setUpGetIt();
  tz.initializeTimeZones();
  initializeDateFormatting('fr_FR', null);

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
  final _storageManager = getIt<StorageManager>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    _updateTheme();

    _storageManager.readCurrentUser();
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
      routes: {"/authentication": (context) => AuthenticationScreen(), "/home": (context) => WeatherScreen()},
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        body: FutureBuilder(
            future: _storageManager.readCurrentUser(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                const Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    return WeatherScreen();
                  }
                } else {
                  return AuthenticationScreen();
                }
              }
              return const Center(child: CircularProgressIndicator());
            })),
      ),
    );
  }
}
