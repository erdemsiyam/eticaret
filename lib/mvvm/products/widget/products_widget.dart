import 'package:eticaret/mvvm/products/bloc/products_bloc.dart';
import 'package:eticaret/mvvm/products/widget/product_card.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final ScrollController _sc = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .7,
      child: BlocBuilder(
        bloc: BlocProvider.of<ProductsBloc>(context),
        builder: (context, state) => NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              double scrollPosition = _sc.position.pixels;
              int itemIndex = 0;
              if (_sc.position.pixels <= 40) {
                //1
              } else {
                scrollPosition -= 40;
                itemIndex = (scrollPosition / 230).floor() + 1;
              }
              print(itemIndex);
              BlocProvider.of<ProductsBloc>(context)
                  .add(ScrollProductsEvent(selectedIndex: itemIndex));
            }
            return true;
          },
          child: GridView(
            controller: _sc,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 4 / 3,
                mainAxisSpacing: 30,
                crossAxisSpacing: 20),
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,

            children: () {
              switch (state.runtimeType) {
                case LoadedState:
                  return (state as LoadedState)
                      .products
                      .map(
                        (product) => ProductCard(
                          product: product,
                          onSelected: (model) {
                            // setState(() {
                            //   AppData.productList.forEach((item) {
                            //     item.isSelected = false;
                            //   });
                            //   model.isSelected = true;
                            // });
                          },
                        ),
                      )
                      .toList();
                default:
                  return [const CircularProgressIndicator()];
              }
            }.call(),
            // AppData.productList
          ),
        ),
      ),
    );
  }
}
