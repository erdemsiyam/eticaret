import 'dart:typed_data';
import 'package:eticaret/mvvm/product/bloc/product_bloc.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:eticaret/widget/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallImagesWidget extends StatelessWidget {
  final Animation<double> animation;
  const SmallImagesWidget({Key? key, required this.animation})
      : super(key: key);

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
      if (state.isPicturesLoaded && state.product.bigPictures != null) {
        return state.product.bigPictures
            ?.map((e) => _smallImage(context, e, index++))
            .toList() as List<Widget>;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Widget _smallImage(BuildContext context, Uint8List uint8list, int index) {
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
          child: Image.memory(uint8list),
        ).ripple(
          () {
            BlocProvider.of<ProductBloc>(context)
                .add(OnImageSelectEvent(index: index));
          },
          borderRadius: const BorderRadius.all(
            Radius.circular(13),
          ),
        ),
      ),
    );
  }
}
