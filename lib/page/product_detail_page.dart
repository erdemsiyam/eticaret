import 'package:eticaret/model/data.dart';
import 'package:eticaret/mvvm/product/bloc/product_bloc.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/mvvm/product/widget/big_image_widget.dart';
import 'package:eticaret/mvvm/product/widget/like_button_widget.dart';
import 'package:eticaret/mvvm/product/widget/product_detail_widget.dart';
import 'package:eticaret/mvvm/product/widget/small_images_widget.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:eticaret/widget/icon_button_widget.dart';
import 'package:eticaret/widget/title_text.dart';
import 'package:flutter/material.dart';
import 'package:eticaret/widget/extentions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  ProductResponse product;
  int selectedImageIndex;
  int selectedSizeIndex;
  int selectedColorIndex;
  ProductDetailPage({
    Key? key,
    required this.product,
    this.selectedImageIndex = 0,
    this.selectedSizeIndex = 0,
    this.selectedColorIndex = 0,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLiked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _flotingButton(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xfffbfbfb),
              Color(0xfff7f7f7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Stack(
            children: <Widget>[
              _picturesSection(),
              ProductDetailWidget(
                product: widget.product,
                onSelectedSizeOptionChanged: (p0) {
                  widget.selectedSizeIndex = p0;
                },
                onSelectedColorOptionChanged: (p0) {
                  widget.selectedColorIndex = p0;
                },
                selectedSizeIndex: widget.selectedSizeIndex,
                selectedColorIndex: widget.selectedColorIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton _flotingButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: LightColor.orange,
      child: Icon(Icons.shopping_basket,
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor),
    );
  }

  Widget _picturesSection() {
    return Column(
      children: <Widget>[
        _appBar(),
        BigImageWidget(
          product: widget.product,
          animation: animation,
          selectedImageIndex: widget.selectedImageIndex,
        ),
        SmallImagesWidget(
          product: widget.product,
          animation: animation,
          onImageIndexSelected: (p0) {
            setState(() {
              widget.selectedImageIndex = p0;
            });
          },
        ),
      ],
    );
  }

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButtonWidget(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 15,
            padding: 12,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const LikeButtonWidget(isLiked: false),
        ],
      ),
    );
  }
}
