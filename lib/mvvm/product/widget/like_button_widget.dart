import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/widget/icon_button_widget.dart';
import 'package:flutter/material.dart';

class LikeButtonWidget extends StatelessWidget {
  final bool isLiked;
  const LikeButtonWidget({Key? key, required this.isLiked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      isLiked ? Icons.favorite : Icons.favorite_border,
      color: isLiked ? LightColor.red : LightColor.lightGrey,
      size: 15,
      padding: 12,
      isOutLine: false,
      onPressed: () {
        // setState(() {
        //   isLiked = !isLiked;
        // });
      },
    );
  }
}
