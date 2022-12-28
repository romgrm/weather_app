import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/theme/colors.cubit.dart';

AppBar getCustomAppBar(
  BuildContext context, {
  String? title,
  Widget? titleWidget,
  List<Widget>? actions,
  bool withBackButton = true,
  Widget? leadingWidget,
}) {
  return AppBar(
    leading: withBackButton ? IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)) : leadingWidget ?? const SizedBox(),
    title: title != null
        ? Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: context.read<ColorsCubit>().state.getPrimary()),
          )
        : titleWidget,
    leadingWidth: (withBackButton || leadingWidget != null) ? 56 : 0,
    actions: actions,
    titleSpacing: 0,
  );
}
