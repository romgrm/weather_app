import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Theme/app.colors.dart';
import '../Theme/dark.colors.dart';
import '../Theme/light.colors.dart';

class ColorsCubit extends Cubit<AppColors> {
  ColorsCubit() : super(_getInitialColors());
  void update(Brightness brightness) {
    brightness == Brightness.light ? emit(LightColors()) : emit(DarkColors());
  }
}

AppColors _getInitialColors() {
  return LightColors();
}
