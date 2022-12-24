import 'package:flutter/material.dart';
import 'package:weather_app/PresentationLayer/authentication.screen.dart';
import 'package:weather_app/Theme/app.theme.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
