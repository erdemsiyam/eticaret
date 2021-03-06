import 'package:eticaret/mvvm/category/model/category_model.dart';
import 'package:eticaret/theme/light_color.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:eticaret/widget/title_text.dart';
import 'package:flutter/material.dart';
import 'package:eticaret/widget/extentions.dart';

class CategoryIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  const CategoryIcon({Key? key, required this.model, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
        padding: AppTheme.hPadding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: model.isSelected ? LightColor.background : Colors.transparent,
          border: Border.all(
            color: model.isSelected ? LightColor.orange : LightColor.grey,
            width: model.isSelected ? 2 : 1,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: model.isSelected ? const Color(0xfffbf2ef) : Colors.white,
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            model.picture != null
                ? Image.memory(model.picture!)
                : const SizedBox(),
            model.title == null
                ? Container()
                : Container(
                    child: TitleText(
                      text: model.title!,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
          ],
        ),
      ).ripple(
        () {
          onSelected(model);
        },
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
