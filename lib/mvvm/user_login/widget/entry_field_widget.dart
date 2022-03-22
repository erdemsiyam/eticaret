import 'package:eticaret/mvvm/user_login/bloc/user_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryField extends StatelessWidget {
  String title;
  bool isPassword;
  ValueChanged<String>? onTextChange;

  EntryField({
    required this.title,
    this.isPassword = false,
    this.onTextChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<UserLoginBloc>(context),
      builder: (_, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: onTextChange,
                obscureText: isPassword,
                enabled: (state is LoadedState) ? true : false,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
