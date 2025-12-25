import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/features/home/presentation/widgets/00_general_home_widgets/general_home_products_grid.dart';

import '../../../data/categories/00_category_products_map.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final products = categoryProductsMap[category.toLowerCase()] ?? [];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GeneralHeader(title: category,trailing: Icon(Icons.search),),
                GeneralHomeProductsGrid(itemCount: products.length, products: products),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
