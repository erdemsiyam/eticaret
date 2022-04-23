import 'package:eticaret/model/data.dart';
import 'package:eticaret/mvvm/product/bloc/product_bloc.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/mvvm/product/widget/options_widget.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:eticaret/widget/extentions.dart';
import 'package:eticaret/widget/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailWidget extends StatelessWidget {
  ProductResponse product;
  void Function(int) onSelectedSizeOptionChanged;
  void Function(int) onSelectedColorOptionChanged;
  int selectedSizeIndex;
  int selectedColorIndex;
  ProductDetailWidget({
    Key? key,
    required this.product,
    required this.onSelectedSizeOptionChanged,
    required this.onSelectedColorOptionChanged,
    this.selectedSizeIndex = 0,
    this.selectedColorIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return Container(
          padding: AppTheme.padding.copyWith(bottom: 0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: const BoxDecoration(
                        color: LightColor.iconColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(height: 10),
                _detailHeader(),
                const SizedBox(height: 20),
                OptionsWidget(
                  product: product,
                  onSelectedSizeOptionChanged: onSelectedSizeOptionChanged,
                  onSelectedColorOptionChanged: onSelectedColorOptionChanged,
                  selectedSizeIndex: selectedSizeIndex,
                  selectedColorIndex: selectedColorIndex,
                ),
                const SizedBox(height: 20),
                _description(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _detailHeader() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TitleText(text: product.title ?? "<item>", fontSize: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const TitleText(
                    text: "\$ ",
                    fontSize: 18,
                    color: LightColor.red,
                  ),
                  TitleText(
                    text: (product.price != null)
                        ? product.price.toString()
                        : "<price>",
                    fontSize: 25,
                  ),
                ],
              ),
              Row(
                children: _stars(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _stars() {
    List<Widget> listWidget = [];
    int point = product.point ?? 0;
    for (int i = 1; i <= 5; i++) {
      if (point >= i) {
        listWidget.add(
          const Icon(Icons.star, color: LightColor.yellowColor, size: 17),
        );
      } else {
        listWidget.add(const Icon(Icons.star_border, size: 17));
      }
    }
    return listWidget;
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleText(
          text: "Product Description",
          fontSize: 14,
        ),
        const SizedBox(height: 20),
        Text(product.description ?? "null"),
      ],
    );
  }
}
