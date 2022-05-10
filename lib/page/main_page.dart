import 'package:eticaret/mvvm/cart/bloc/cart_bloc.dart';
import 'package:eticaret/mvvm/category/bloc/category_bloc.dart';
import 'package:eticaret/mvvm/favorites/bloc/favorites_bloc.dart';
import 'package:eticaret/mvvm/products/bloc/products_bloc.dart';
import 'package:eticaret/page/inner_page/cart_page.dart';
import 'package:eticaret/page/inner_page/favorites_page.dart';
import 'package:eticaret/page/inner_page/home_page.dart';
import 'package:eticaret/page/inner_page/shopping_cart_page.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:eticaret/widget/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:eticaret/widget/title_text.dart';
import 'package:flutter/material.dart';
import 'package:eticaret/widget/extentions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsBloc>(context).add(GetProductsEvent());
    BlocProvider.of<CategoryBloc>(context).add(GetCategoriesEvent());
    BlocProvider.of<CartBloc>(context).add(GetCartEvent());
    BlocProvider.of<FavoritesBloc>(context).add(GetFavoritesEvent());
  }

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.black54),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff8f8f8),
                      blurRadius: 10,
                      spreadRadius: 10),
                ],
              ),
              child: Image.asset("assets/user.png"),
            ),
          ).ripple(
            () {},
            borderRadius: const BorderRadius.all(
              Radius.circular(13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        color: Theme.of(context).backgroundColor,
        boxShadow: AppTheme.shadow,
      ),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(
      () {},
      borderRadius: const BorderRadius.all(
        Radius.circular(13),
      ),
    );
  }

  Widget _title() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(
                text: getTitle1(),
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
              TitleText(
                text: getTitle2(),
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          const Spacer(),
          // !(index == 0)
          //     ?
          //     :
          const SizedBox(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _appBar(),
                    _title(),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child: getSelectedPage(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(
                onIconPresedCallback: indexChanged,
              ),
            )
          ],
        ),
      ),
    );
  }

  indexChanged(int newIndex) {
    setState(() {
      index = newIndex;
      if (newIndex == 2) {
        BlocProvider.of<CartBloc>(context).add(GetCartEvent());
      } else if (newIndex == 3) {
        BlocProvider.of<FavoritesBloc>(context).add(GetFavoritesEvent());
      }
    });
  }

  Widget getSelectedPage() {
    switch (index) {
      case 0:
      case 1:
        return const HomePage(title: "aaa");
      case 2:
        return Align(
          alignment: Alignment.topCenter,
          child: ShoppingCartPage(),
        );
      case 3:
        return Align(
          alignment: Alignment.topCenter,
          child: FavoritesPage(),
        );
      default:
        return Container();
    }
  }

  String getTitle1() {
    switch (index) {
      case 0:
      case 1:
        return 'Our';
      case 2:
      case 3:
        return 'Favorite';
      default:
        return 'Shopping';
    }
  }

  String getTitle2() {
    switch (index) {
      case 0:
      case 1:
        return 'Products';
      case 2:
      case 3:
        return 'Products';
      default:
        return 'Cart';
    }
  }
}
