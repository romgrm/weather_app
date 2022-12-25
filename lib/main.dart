import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/theme/colors.cubit.dart';

import 'Theme/app.theme.dart';
import 'presentationLayer/screens/authentication.screen.dart';

void main() {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ColorsCubit()),
      ],
      child: const App(),
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
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const Scaffold(body: AuthenticationScreen()),
    );
  }
}
