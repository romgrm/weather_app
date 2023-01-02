import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../localize/localize.dart';
import '../../theme/colors.cubit.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          MdiIcons.cloud,
          size: 150,
          color: context.read<ColorsCubit>().state.getThirdly(),
        ),
        Text(
          getLocalize("authenticationLogo"),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 40, color: context.read<ColorsCubit>().state.getSecondary()),
        ),
      ],
    );
  }
}
