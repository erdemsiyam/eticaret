import 'package:eticaret/mvvm/product/bloc/product_bloc.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/widget/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BigImageWidget extends StatelessWidget {
  final Animation<double> animation;
  const BigImageWidget({Key? key, required this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: animation.value,
          child: child,
        );
      },
      animation: animation,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          const TitleText(
            text: "AIP",
            fontSize: 160,
            color: LightColor.lightGrey,
          ),
          BlocBuilder(
            bloc: BlocProvider.of<ProductBloc>(context),
            builder: (context, state) => _image(state as ProductState),
          ),
        ],
      ),
    );
  }

  Widget _image(ProductState state) {
    if (state is ProductLoadedState &&
        state.isPicturesLoaded &&
        state.product.bigPictures != null) {
      return Image.memory(
          state.product.bigPictures![state.bigPhotoSelectedIndex]);
    } else {
      return const SizedBox();
    }
  }
}
