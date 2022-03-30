import 'package:eticaret/mvvm/category/bloc/category_bloc.dart';
import 'package:eticaret/mvvm/category/model/category_model.dart';
import 'package:eticaret/mvvm/category/widget/category_icon.dart';
import 'package:eticaret/mvvm/products/bloc/products_bloc.dart'
    as products_bloc;
import 'package:eticaret/repository/category_repository.dart';
import 'package:eticaret/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  // Category? selectedCategory = Category(uuid: "0");
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
                          BlocProvider.of<products_bloc.ProductsBloc>(context)
                              .add(products_bloc.GetProductsByCategoryEvent(
                                  category: model));
                          BlocProvider.of<CategoryBloc>(context).add(
                              SelectCategoryEvent(
                                  selectedCategoryUuid: model.uuid ?? ""));
                          // setState(() {
                          //   selectedCategory = model;
                          // });
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
