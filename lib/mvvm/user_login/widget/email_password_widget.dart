import 'package:flutter/material.dart';

import 'entry_field_widget.dart';

class EmailPasswordWidget extends StatelessWidget {
  final ValueChanged<String>? onUsernameTextChange;
  final ValueChanged<String>? onPasswordTextChange;
  const EmailPasswordWidget({
    this.onUsernameTextChange,
    this.onPasswordTextChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EntryField(
          title: "Email id",
          onTextChange: onUsernameTextChange,
        ),
        EntryField(
          title: "Password",
          onTextChange: onPasswordTextChange,
          isPassword: true,
        ),
      ],
    );
  }
}
