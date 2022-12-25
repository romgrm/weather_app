import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/widgets/logo.dart';
import 'package:weather_app/localize/localize.dart';
import 'package:weather_app/presentationLayer/bloc/authentication.cubit.dart';
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
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            print("loading");
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          onSuccess: (user) => Center(
            child: Text(
              "OnSuccess",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 40, color: context.read<ColorsCubit>().state.getSecondary()),
            ),
          ),
          orElse: () {
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
                                      setState(() {
                                        email = value;
                                      });
                                    })),
                                TextInputWidget(
                                    hintText: "authenticationPasswordTextInputLabel",
                                    isObscure: true,
                                    textControllerCallback: ((value) {
                                      setState(() {
                                        password = value;
                                      });
                                    })),
                                Padding(
                                  padding: const EdgeInsets.only(top: spaceM),
                                  child: ElevatedButton(
                                      onPressed: (email.isNotEmpty && password.isNotEmpty)
                                          ? () {
                                              if (_formKey.currentState!.validate()) {
                                                context.read<AuthenticationCubit>().login(email, password);
                                                FocusManager.instance.primaryFocus?.unfocus();
                                              }
                                            }
                                          : null,
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
          },
          onError: (errorMessage) {
            return Text(errorMessage);
          },
        );
      },
    );
  }
}
