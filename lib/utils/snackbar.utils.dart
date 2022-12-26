import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/theme/colors.cubit.dart';

class SnackBarUtils {
  static showSnackBar(
    BuildContext context, {
    Widget? prefix,
    required Widget message,
    Widget? subMessage,
    Widget? button,
    Color? backgroundColor,
    Color? closeIconColor,
    Duration duration = const Duration(seconds: 4),
  }) {
    Widget _content = Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: SizedBox(
            height: 24,
            child: closeIconColor != null
                ? IconButton(
                    onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                    iconSize: 20,
                    icon: Icon(Icons.close, color: closeIconColor),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  prefix != null ? Padding(padding: const EdgeInsets.only(right: 16.0), child: prefix) : const SizedBox.shrink(),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: const EdgeInsets.only(bottom: 4.0), child: message),
                        subMessage ?? const SizedBox.shrink(),
                      ],
                    ),
                  )
                ],
              ),
              button != null ? Padding(padding: const EdgeInsets.only(top: 16.0), child: button) : const SizedBox.shrink(),
            ],
          ),
        )
      ],
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: context.read<ColorsCubit>().state.getThirdly(),
        dismissDirection: DismissDirection.none,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        behavior: SnackBarBehavior.floating,
        duration: duration,
        content: _content,
      ),
    );
  }
}
