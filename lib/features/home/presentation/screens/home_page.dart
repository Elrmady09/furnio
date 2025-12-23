import 'package:flutter/material.dart';
import 'package:furnio/features/home/logic/home_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/space.dart';
import '../../data/home_products_data.dart';
import '../../logic/search_provider.dart';
import '../widgets/00_general_home_widgets/general_home_search.dart';
import '../widgets/02_search_and_filter_widgets/recent_search_box.dart';
import '../widgets/02_search_and_filter_widgets/search_blur_layer.dart';
import '../widgets/home_categories.dart';
import '../widgets/home_filter_tabs.dart';
import '../widgets/home_header.dart';
import '../widgets/00_general_home_widgets/general_home_products_grid.dart';
import '../widgets/home_special_offer.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final homeProvider = context.watch<HomeProvider>();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: SingleChildScrollView(
                controller: homeProvider.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeightSpace(space: 0.02),
                    const HomeHeader(),
                    HeightSpace(space: 0.07),
                    RecentSearchBox(),
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
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: homeProvider.isSearching ? const SearchBlurLayer() : const SizedBox(),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: homeProvider.showSearch
                  ? (homeProvider.isSearching ? size.height * 0.05 : size.height * 0.11)
                  : -100, // يختفي عند التمرير
              left: size.width * 0.04,
              right: size.width * 0.04,
              child: Column(
                children: [
                  GeneralHomeSearch(
                    onSubmitted: (value){
                      homeProvider.addSearch(value);
                      if (value.isEmpty) return;
                      context.read<SearchProvider>().search(value);
                      context.push('/SearchAndFilter',extra: value);



                    },
                  ),
                  HeightSpace(space: 0.02),
                  RecentSearchBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






