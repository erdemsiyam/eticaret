import 'package:eticaret/mvvm/product/bloc/product_bloc.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/widget/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeButtonWidget extends StatefulWidget {
  bool isLiked;
  ProductResponse product;
  LikeButtonWidget({
    Key? key,
    required this.product,
    required this.isLiked,
  }) : super(key: key);

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      widget.isLiked ? Icons.favorite : Icons.favorite_border,
      color: widget.isLiked ? LightColor.red : LightColor.lightGrey,
      size: 15,
      padding: 12,
      isOutLine: false,
      onPressed: () {
        BlocProvider.of<ProductBloc>(context).add(
          OnFavoriteChangeEvent(
            product: widget.product,
            isAdded: !widget.isLiked,
          ),
        );
        setState(() {
          widget.isLiked = !widget.isLiked;
        });
      },
    );
  }
}
