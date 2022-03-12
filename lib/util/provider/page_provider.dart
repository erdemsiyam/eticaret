import 'package:deneme/util/constant/page_name.dart';
import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  // Singleton
  PageProvider._singleton();
  static final PageProvider _instance = PageProvider._singleton();
  static PageProvider get instance => _instance;

  // Property
  String pageName = PageName.SPLASH;
  String? param;

  // Method
  void changePage(String newPageName, {String? param}) {
    pageName = newPageName;
    this.param = param;
    notifyListeners();
  }
}


/*
NavigationController navigation =
        Provider.of<NavigationController>(context, listen: false);
  navigation.changeScreen('/');
 */