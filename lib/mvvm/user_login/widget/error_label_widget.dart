import 'package:eticaret/mvvm/user_login/bloc/user_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorLabel extends StatelessWidget {
  const ErrorLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<UserLoginBloc>(context),
      builder: (_, state) {
        if (state is LoadedState && state.errorText != null) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              state.errorText!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
