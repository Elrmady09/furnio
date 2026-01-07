import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:furnio/features/home/presentation/widgets/00_general_home_widgets/general_home_filter_tap.dart';
import 'package:furnio/features/home/presentation/widgets/00_general_home_widgets/general_home_products_grid.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_lists.dart';
import '../../../data/favorite_data.dart';
import '../../../logic/home_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GeneralHeader(title: 'My Favorite',trailing: Icon(Icons.search),),
                HeightSpace1(space: 7),
                GeneralHomeFilterTap(items: AppLists.filtersTaps, selectedIndex:provider.selectedFilter, onTap: provider.changeFilter,),
                HeightSpace1(space: 12),
                GeneralHomeProductsGrid(itemCount: itemFavoriteProducts.length, products: itemFavoriteProducts),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
