import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/spacers/spacers.dart';
import '../../common/widgets/logo.dart';
import '../../localize/localize.dart';
import '../../theme/colors.cubit.dart';
import '../../utils/snackbar.utils.dart';
import '../bloc/authentication.cubit.dart';
import '../widgets/text_input.widget.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                state.whenOrNull(
                  loading: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                  },
                  onError: (errorMessage) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).pop();
                      SnackBarUtils.showSnackBar(context, message: Text(errorMessage));
                    });
                  },
                  onSuccess: (user) {
                    Navigator.of(context).pop();
                    Navigator.popAndPushNamed(context, "/home");
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return Padding(
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
                                          style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(spaceM)))),
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              context.read<AuthenticationCubit>().login(email, password);
                                              FocusManager.instance.primaryFocus?.unfocus();
                                            }
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
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
