import 'package:eticaret/mvvm/category/bloc/category_bloc.dart';
import 'package:eticaret/mvvm/category/widget/category_icon.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: BlocBuilder(
        bloc: BlocProvider.of<CategoryBloc>(context),
        builder: (context, state) => ListView(
          scrollDirection: Axis.horizontal,
          children:
              // AppData.categoryList
              () {
            switch (state.runtimeType) {
              case LoadedState:
                return (state as LoadedState)
                    .categories
                    .map(
                      (category) => CategoryIcon(
                        model: category,
                        onSelected: (model) {
                          // setState(() {
                          //   AppData.categoryList.forEach((item) {
                          //     item.isSelected = false;
                          //   });
                          //   model.isSelected = true;
                          // });
                        },
                      ),
                    )
                    .toList();
              default:
                return [const CircularProgressIndicator()];
            }
          }.call(),
        ),
      ),
    );
  }
}
