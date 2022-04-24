import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/widget/extentions.dart';
import 'package:eticaret/widget/title_text.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatefulWidget {
  ProductResponse product;
  void Function(int) onSelectedSizeOptionChanged;
  void Function(int) onSelectedColorOptionChanged;
  int selectedSizeIndex;
  int selectedColorIndex;
  OptionsWidget({
    Key? key,
    required this.product,
    required this.onSelectedSizeOptionChanged,
    required this.onSelectedColorOptionChanged,
    this.selectedSizeIndex = 0,
    this.selectedColorIndex = 0,
  }) : super(key: key);

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        children: [
          _optionsShoesNumber(context: context),
          const SizedBox(height: 20),
          _optionsColor(),
        ],
      ),
    );
  }

  Widget _optionsShoesNumber({required BuildContext context}) {
    List<Widget> options = [];
    for (int i = 0; i < (widget.product.sizeOptions?.length ?? 0); i++) {
      options.add(
        _shoesNumber(
          context: context,
          text: widget.product.sizeOptions![i],
          onSelected: () {
            setState(() {
              widget.selectedSizeIndex = i;
              widget.onSelectedSizeOptionChanged.call(i);
            });
          },
          isSelected: widget.selectedSizeIndex == i,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options,
          // <Widget>[
          //   _shoesNumber(context, "US 6"),
          //   _shoesNumber(context, "US 7", isSelected: true),
          //   _shoesNumber(context, "US 8"),
          //   _shoesNumber(context, "US 9"),
          // ],
        )
      ],
    );
  }

  Widget _shoesNumber({
    required BuildContext context,
    required String text,
    required VoidCallback onSelected,
    bool isSelected = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        color: isSelected ? Colors.green : Theme.of(context).backgroundColor,
      ),
      child: TitleText(
        text: text,
        fontSize: 16,
        color: isSelected ? LightColor.background : LightColor.titleTextColor,
      ),
    ).ripple(() {
      onSelected.call();
    }, borderRadius: const BorderRadius.all(Radius.circular(13)));
  }

  Widget _optionsColor() {
    List<Widget> options = [];
    for (int i = 0; i < (widget.product.colorOptions?.length ?? 0); i++) {
      options.add(
        _colorWidget(
          context: context,
          color: _getColor(widget.product.colorOptions![i]),
          onSelected: () {
            setState(() {
              widget.selectedColorIndex = i;
              widget.onSelectedColorOptionChanged.call(i);
            });
          },
          isSelected: widget.selectedColorIndex == i,
        ),
      );
      options.add(
        const SizedBox(
          width: 10,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleText(
          text: "Available Color",
          fontSize: 14,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: options,
          // <Widget>[
          //   _colorWidget(LightColor.yellowColor, isSelected: true),
          //   const SizedBox(
          //     width: 30,
          //   ),
          //   _colorWidget(LightColor.lightBlue),
          //   const SizedBox(
          //     width: 30,
          //   ),
          //   _colorWidget(LightColor.black),
          //   const SizedBox(
          //     width: 30,
          //   ),
          //   _colorWidget(LightColor.red),
          //   const SizedBox(
          //     width: 30,
          //   ),
          //   _colorWidget(LightColor.skyBlue),
          // ],
        )
      ],
    );
  }

  Widget _colorWidget({
    required BuildContext context,
    required Color color,
    required VoidCallback onSelected,
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: () {
        onSelected.call();
      },
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color.withAlpha(150),
        child: isSelected
            ? Icon(
                Icons.check_circle,
                color: color,
                size: 18,
              )
            : CircleAvatar(radius: 7, backgroundColor: color),
      ),
    );
  }

  Color _getColor(String colorText) {
    switch (colorText) {
      case "RED":
        return Colors.red;
      case "BLUE":
        return Colors.blue;
      case "WHITE":
        return Colors.white;
      case "BLACK":
        return Colors.black;
      case "ORANGE":
        return Colors.orange;
      case "PINK":
        return Colors.pink;
      case "YELLOW":
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}
