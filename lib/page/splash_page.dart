import 'package:eticaret/mvvm/category/bloc/category_bloc.dart';
import 'package:eticaret/mvvm/products/bloc/products_bloc.dart';
import 'package:eticaret/mvvm/user_login/bloc/user_login_bloc.dart';
import 'package:eticaret/page/inner_page/home_page.dart';
import 'package:eticaret/page/login_page.dart';
import 'package:eticaret/page/main_page.dart';
import 'package:eticaret/repository/user_repository.dart';
import 'package:eticaret/util/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'e',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: '-Com',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'merce',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Auth & Token Control Then Routing
    UserRepository.instance.getUserAndToken().then(
      (User? user) {
        if (user == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (_) => UserLoginBloc(),
                child: const LoginPage(),
              ),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => CategoryBloc(),
                  ),
                  BlocProvider(
                    create: (_) => ProductsBloc(),
                  ),
                ],
                child: const MainPage(title: ""),
              ),
            ),
          );
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _title(),
            ],
          ),
        ),
      ),
    );
  }
}
