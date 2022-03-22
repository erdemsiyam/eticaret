import 'package:eticaret/page/home_page.dart';
import 'package:eticaret/page/login_page.dart';
import 'package:eticaret/page/main_page.dart';
import 'package:eticaret/page/product_detail_page.dart';
import 'package:eticaret/page/shopping_cart_page.dart';
import 'package:eticaret/page/signup_page.dart';
import 'package:eticaret/page/splash_page.dart';
import 'package:eticaret/util/constant/page_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'util/management/user_management.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await UserManagement.instance.init();
  runApp(
    const MyApp(),
    // MultiProvider(
    //   providers: [
    //     ListenableProvider<PageProvider>(create: (_) => PageProvider.instance),
    //     ListenableProvider<AuthProvider>(create: (_) => AuthProvider.instance),
    //     // Provider<PageProvider>(create: (_) => PageProvider.instance),
    //     // Provider<AuthProvider>(create: (_) => AuthProvider.instance),
    //   ],
    //   child: const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PageProvider pageProvider = Provider.of<PageProvider>(context);
    return MaterialApp(
      home: SplashPage(),
      //  Navigator(
      //   pages: [
      //     if (pageProvider.pageName == PageName.SPLASH)
      //       MaterialPage(child: SplashPage()),
      //     if (pageProvider.pageName == PageName.LOGIN)
      //       MaterialPage(child: LoginPage()),
      //     if (pageProvider.pageName == PageName.SIGNUP)
      //       MaterialPage(child: SignUpPage()),
      //     if (pageProvider.pageName == PageName.HOME)
      //       MaterialPage(child: HomePage(title: "")),
      //     if (pageProvider.pageName == PageName.DETAIL)
      //       MaterialPage(child: ProductDetailPage()),
      //     if (pageProvider.pageName == PageName.CART)
      //       const MaterialPage(child: ShoppingCartPage()),
      //     if (pageProvider.pageName == PageName.FAVORITE)
      //       MaterialPage(child: SplashPage()),
      //   ],
      //   onPopPage: (_, __) => false,
      // ),
    );
  }
}
