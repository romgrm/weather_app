import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/common/widgets/logo.dart';
import 'package:weather_app/localize/localize.dart';
import 'package:weather_app/theme/colors.cubit.dart';
import '../widgets/text_input.widget.dart';

import '../../common/spacers/spacers.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spaceXL, vertical: spaceM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: spaceXXL),
                child: LogoWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: spaceXXL),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextInputWidget(
                            hintText: "authenticationEmailTextInputLabel",
                            isObscure: false,
                            textControllerCallback: ((value) {
                              print(value);
                            })),
                        TextInputWidget(
                            hintText: "authenticationPasswordTextInputLabel",
                            isObscure: true,
                            textControllerCallback: ((value) {
                              print(value);
                            })),
                        Padding(
                          padding: const EdgeInsets.only(top: spaceM),
                          child: ElevatedButton(
                              onPressed: () {
                                _formKey.currentState?.validate();
                              },
                              child: Text(
                                getLocalize("authValidateButtonLabel"),
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20, color: context.read<ColorsCubit>().state.getPrimary()),
                              )),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
