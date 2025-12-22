import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_header.dart';
import '../../../../../core/widgets/space.dart';
import '../../../data/favorite_data.dart';
import '../../widgets/00_general_home_widgets/general_home_filter_tap.dart';
import '../../widgets/00_general_home_widgets/general_home_products_grid.dart';

class MostPopularPage extends StatelessWidget {
  const MostPopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GeneralHeader(title: 'My Favorite',trailing: Icon(Icons.search),),
                HeightSpace(space: 0.03),
                GeneralHomeFilterTap(),
                HeightSpace(space: 0.04),
                GeneralHomeProductsGrid(itemCount: itemFavoriteProducts.length, products: itemFavoriteProducts),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
