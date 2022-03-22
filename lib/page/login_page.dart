import 'package:eticaret/mvvm/user_login/bloc/user_login_bloc.dart';
import 'package:eticaret/mvvm/user_login/widget/create_account_label_widget.dart';
import 'package:eticaret/mvvm/user_login/widget/divider_widget.dart';
import 'package:eticaret/mvvm/user_login/widget/email_password_widget.dart';
import 'package:eticaret/mvvm/user_login/widget/facebook_button_widget.dart';
import 'package:eticaret/mvvm/user_login/widget/forgot_password_label_widget.dart';
import 'package:eticaret/mvvm/user_login/widget/submit_button_widget.dart';
import 'package:eticaret/mvvm/user_login/widget/title_widget.dart';
import 'package:eticaret/widget/bezier_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    const TitleWidget(),
                    const SizedBox(height: 50),
                    EmailPasswordWidget(
                      onUsernameTextChange: (value) {
                        username = value;
                      },
                      onPasswordTextChange: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    SubmitButton(
                      onClick: () {
                        if (username != null && password != null) {
                          BlocProvider.of<UserLoginBloc>(context).add(
                            LoginClickEvent(
                              username: username!,
                              password: password!,
                            ),
                          );
                        }
                      },
                    ),
                    const ForgotPasswordLabel(),
                    const DividerWidget(),
                    const FacebookButton(),
                    SizedBox(height: height * .055),
                    const CreateAccountLabel(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
