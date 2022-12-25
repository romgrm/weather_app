import 'package:flutter/material.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
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
                      ElevatedButton(
                          onPressed: () {
                            _formKey.currentState?.validate();
                          },
                          child: Text("test"))
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
