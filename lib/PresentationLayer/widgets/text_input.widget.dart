import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../common/spacers/spacers.dart';
import '../../localize/localize.dart';
import '../../theme/colors.cubit.dart';
import '../bloc/authentication.cubit.dart';

typedef TextControllerCallback = Function(String value);

class TextInputWidget extends StatefulWidget {
  final TextControllerCallback textControllerCallback;
  final String? hintText;
  final bool isObscure;
  const TextInputWidget({super.key, this.hintText, this.isObscure = false, required this.textControllerCallback});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final _textController = TextEditingController();
  String value = "";
  bool obscure = true;

  @override
  void initState() {
    super.initState();

    _textController.addListener(() {
      widget.textControllerCallback(_textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        state.whenOrNull(onError: ((errorMessage) => _textController.clear()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: spaceS),
        child: TextFormField(
          controller: _textController,
          decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 18,
                  ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(spaceM),
                borderSide: BorderSide(
                  color: context.read<ColorsCubit>().state.getThirdly(),
                  width: 1.0,
                ),
              ),
              hintText: getLocalize(widget.hintText ?? ""),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(spaceM),
              ),
              suffixIcon: widget.isObscure
                  ? InkWell(
                      onTap: () => setState(() {
                        obscure = !obscure;
                      }),
                      child: Icon(obscure ? MdiIcons.eye : MdiIcons.eyeOff),
                    )
                  : null),
          obscureText: widget.isObscure ? obscure : false,
          validator: (value) {
            if (widget.isObscure) {
              if (value == null || value.isEmpty) {
                return getLocalize("authPasswordValidatorText");
              }
            } else {
              bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+").hasMatch(value!);

              if (value.isEmpty || !emailValid) {
                return getLocalize("authMailValidatorText");
              }
            }
            return null;
          },
        ),
      ),
    );
  }
}
