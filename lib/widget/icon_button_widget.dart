import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/widget/extentions.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final double padding;
  final double size;
  final Color color;
  final bool isOutLine;
  final IconData icon;
  final Function onPressed;
  const IconButtonWidget(
    this.icon, {
    Key? key,
    this.color = LightColor.iconColor,
    this.size = 20,
    this.padding = 10,
    this.isOutLine = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: const BorderRadius.all(
          Radius.circular(13),
        ),
        color:
            isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0xfff8f8f8),
            blurRadius: 5,
            spreadRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(
      () {
        onPressed();
      },
      borderRadius: const BorderRadius.all(
        Radius.circular(13),
      ),
    );
  }
}
