import 'package:flutter/material.dart';
import 'package:furnio/features/home/logic/home_provider.dart';
import 'package:furnio/features/home/presentation/widgets/00_general_home_widgets/general_home_filter_tap.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/space.dart';
import '../../data/home_products_data.dart';
import '../widgets/home_categories.dart';
import '../widgets/home_filter_tabs.dart';
import '../widgets/home_header.dart';
import '../widgets/00_general_home_widgets/general_home_products_grid.dart';
import '../widgets/home_search.dart';
import '../widgets/home_special_offer.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final homeProvider = context.watch<HomeProvider>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpace(space: 0.02),
                const HomeHeader(),
                HeightSpace(space: 0.02),
                HomeSearch(
                  onChanged: (value) => homeProvider.setSearchQuery(value),
                ),
                HeightSpace(space: 0.025),
                const HomeSpecialOffer(),
                HeightSpace(space: 0.01),
                const HomeCategories(),
                HeightSpace(space: 0.02),
                const HomeFilterTabs(),
                HeightSpace(space: 0.02),
                GeneralHomeProductsGrid(itemCount: itemHomeProducts.length, products: itemHomeProducts,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






