import 'package:eticaret/mvvm/product/bloc/product_bloc.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:eticaret/widget/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallImagesWidget extends StatelessWidget {
  ProductResponse product;
  final Animation<double> animation;
  void Function(int) onImageIndexSelected;
  SmallImagesWidget({
    Key? key,
    required this.product,
    required this.animation,
    required this.onImageIndexSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: BlocBuilder(
        bloc: BlocProvider.of<ProductBloc>(context),
        builder: (context, state) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _children(context, state as ProductState),
          // AppData.showThumbnailList.map((x) => _thumbnail(x)).toList(),
        ),
      ),
    );
  }

  List<Widget> _children(BuildContext context, ProductState state) {
    int index = 0;
    if (state is ProductLoadedState) {
      // if (state.isPicturesLoaded && state.product.bigPictures != null) {
      if (product.images != null) {
        return product.images
            ?.map((e) => _smallImage(context, e, index++))
            .toList() as List<Widget>;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  // Widget _smallImage(BuildContext context, Uint8List uint8list, int index) {
  Widget _smallImage(BuildContext context, String imageUrl, int index) {
    return AnimatedBuilder(
      animation: animation,
      //  builder: null,
      builder: (context, child) => AnimatedOpacity(
        opacity: animation.value,
        duration: const Duration(milliseconds: 500),
        child: child,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: LightColor.grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(13),
            ),
            // color: Theme.of(context).backgroundColor,
          ),
          child: Image.network(imageUrl),
        ).ripple(
          () {
            // BlocProvider.of<ProductBloc>(context)
            //     .add(OnImageSelectEvent(index: index));
            onImageIndexSelected.call(index);
          },
          borderRadius: const BorderRadius.all(
            Radius.circular(13),
          ),
        ),
      ),
    );
  }
}
