import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/mvvm/product/widget/big_image_widget.dart';
import 'package:eticaret/mvvm/product/widget/like_button_widget.dart';
import 'package:eticaret/mvvm/product/widget/product_detail_widget.dart';
import 'package:eticaret/mvvm/product/widget/small_images_widget.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:eticaret/widget/icon_button_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  ProductResponse product;
  int selectedImageIndex;
  ProductDetailPage({
    Key? key,
    required this.product,
    this.selectedImageIndex = 0,
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
                  widget.product.selectedSizeOption =
                      widget.product.sizeOptions![p0];
                },
                onSelectedColorOptionChanged: (p0) {
                  widget.product.selectedColorOption =
                      widget.product.colorOptions![p0];
                },
                selectedSizeIndex:
                    getSelectedSizeIndex(), //widget.selectedSizeIndex,
                selectedColorIndex:
                    getSelectedColorIndex(), //widget.selectedColorIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int getSelectedSizeIndex() {
    if (widget.product.selectedSizeOption != null) {
      for (int i = 0; i < widget.product.sizeOptions!.length; i++) {
        if (widget.product.selectedSizeOption ==
            widget.product.sizeOptions![i]) {
          return i;
        }
      }
    }
    return 0;
  }

  int getSelectedColorIndex() {
    if (widget.product.selectedColorOption != null) {
      for (int i = 0; i < widget.product.colorOptions!.length; i++) {
        if (widget.product.selectedColorOption ==
            widget.product.colorOptions![i]) {
          return i;
        }
      }
    }
    return 0;
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
          LikeButtonWidget(
            product: widget.product,
            isLiked: widget.product.isLiked,
          ),
        ],
      ),
    );
  }
}
