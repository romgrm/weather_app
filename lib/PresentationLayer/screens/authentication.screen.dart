import 'package:flutter/material.dart';

import '../../common/spacers/spacers.dart';
import '../../localize/localize.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _textControllerMail = TextEditingController();
  final _textControllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String mailValue = "";
  String passwordValue = "";
  bool isObscure = true;

  @override
  void initState() {
    super.initState();

    _textControllerMail.addListener(() {
      setState(() {
        mailValue = _textControllerMail.text;
      });
    });
    _textControllerPassword.addListener(() {
      setState(() {
        passwordValue = _textControllerPassword.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spaceXL, vertical: spaceM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(bottom: spaceXXL * 3),
              //   child: Center(child: SvgPicture.asset("assets/images/logo/logo.svg")),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: spaceXL),
              //   child: Text(getLocalize("authTitleLabel"),
              //       style: Theme.of(context).textTheme.titleMedium?.copyWith(
              //             fontSize: 32,
              //           )),
              // ),
              TextFormField(
                controller: _textControllerMail,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 18,
                      ),
                  hintText: getLocalize("authenticationEmailTextInputLabel"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(spaceM),
                    // borderSide: BorderSide(
                    //   color: context.read<ColorsCubit>().state.getGreyTwo(),
                    //   width: 1.0,
                    // ),
                  ),
                ),
                validator: (email) {
                  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+").hasMatch(email!);

                  if (email.isEmpty || !emailValid) {
                    // return getLocalize("authMailValidatorText");
                  }
                  return null;
                },
              ),
              /* Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: spaceM),
                        child: TextFormField(
                          controller: _textControllerMail,
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontSize: 18,
                                ),
                            // hintText: getLocalize("authMailHintText"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(spaceM),
                              // borderSide: BorderSide(
                              //   color: context.read<ColorsCubit>().state.getGreyTwo(),
                              //   width: 1.0,
                              // ),
                            ),
                          ),
                          validator: (email) {
                            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+").hasMatch(email!);

                            if (email.isEmpty || !emailValid) {
                              // return getLocalize("authMailValidatorText");
                            }
                            return null;
                          },
                        ),
                      ),
                      TextFormField(
                        controller: _textControllerPassword,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontSize: 18,
                                ),
                            // hintText: getLocalize("authPasswordHintText"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(spaceM),
                              // borderSide: BorderSide(
                              //   color: context.read<ColorsCubit>().state.getGreyTwo(),
                              //   width: 1.0,
                              // ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(() {
                                isObscure = !isObscure;
                              }),
                              // child: Icon(isObscure ? MdiIcons.eye : MdiIcons.eyeOff),
                            )),
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            // return getLocalize("authPasswordValidatorText");
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: spaceL, bottom: spaceL),
                        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                          InkWell(
                              // onTap: () => context.router.push(const PasswordForgottenRoute()),
                              // child: Text(getLocalize("authPasswordForgottenLabel"),
                              //     style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16, color: context.read<ColorsCubit>().state.getGreyOne())),
                              ),
                        ]),
                      ),
                      // Button(
                      //   label: getLocalize("authLoginButtonLabel"),
                      //   onPressed: (mailValue.isNotEmpty && passwordValue.isNotEmpty)
                      //       ? () {
                      //           if (_formKey.currentState!.validate()) {
                      //             context.read<AccountCubit>().loginAccount(mailValue, passwordValue);
                      //             FocusManager.instance.primaryFocus?.unfocus();
                      //           }
                      //         }
                      //       : null,
                      // )
                    ],
                  )) */
            ],
          ),
        ),
      ],
    );
  }
}
