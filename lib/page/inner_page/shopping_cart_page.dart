import 'package:eticaret/mvvm/cart/bloc/cart_bloc.dart';
import 'package:eticaret/mvvm/product/bloc/product_bloc.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/page/product_detail_page.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:eticaret/widget/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.padding,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _cartItems(context: context),
            const Divider(thickness: 1, height: 70),
            _price(context),
            const SizedBox(height: 30),
            _submitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _cartItems({required BuildContext context}) {
    // return Column(children: AppData.cartList.map((x) => _item(x)).toList());
    return BlocBuilder(
      bloc: BlocProvider.of<CartBloc>(context),
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadedState:
            return Column(
              children: (state as LoadedState)
                  .products
                  .map(
                    (product) => _item(context, product),
                  )
                  .toList(),
            );
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _item(BuildContext context, ProductResponse model) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => ProductBloc(model),
                ),
              ],
              child: ProductDetailPage(product: model),
            ),
          ),
        );
      },
      child: SizedBox(
        height: 80,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.2,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                color: LightColor.lightGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: -20,
                    bottom: -20,
                    child: Image.network(model.smallImage!),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListTile(
                title: TitleText(
                  text: model.title!,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                subtitle: Row(
                  children: <Widget>[
                    const TitleText(
                      text: '\$ ',
                      color: LightColor.red,
                      fontSize: 12,
                    ),
                    TitleText(
                      text: model.price.toString(),
                      fontSize: 14,
                    ),
                  ],
                ),
                trailing: Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: LightColor.lightGrey.withAlpha(150),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: LightColor.orange,
                    ),
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context).add(
                        DeleteCartItemEvent(product: model),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _price(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<CartBloc>(context),
      builder: (context, state) {
        int price = 0;
        int itemsCount = 0;
        switch (state.runtimeType) {
          case LoadedState:
            itemsCount = (state as LoadedState).products.length;
            for (var e in state.products) {
              price += (e.price ?? 0);
            }
            break;
          default:
            itemsCount = 0;
            price = 0;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TitleText(
              text: '$itemsCount Items',
              color: LightColor.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            TitleText(
              text: '\$$price',
              fontSize: 18,
            ),
          ],
        );
      },
    );
  }

  Widget _submitButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(LightColor.orange),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4),
        width: AppTheme.fullWidth(context) * .75,
        child: const TitleText(
          text: 'Next',
          color: LightColor.background,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
