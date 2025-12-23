import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:furnio/features/home/presentation/widgets/00_general_home_widgets/general_home_filter_tap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_lists.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/filter_provider.dart';
import '../../../logic/home_provider.dart';
import '../../widgets/03_sort_and_filter_widgets/sort_and_filter_actions.dart';
import '../../widgets/03_sort_and_filter_widgets/sort_and_filter_price_range.dart';

class SortAndFilterBottomSheet extends StatelessWidget {
  const SortAndFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final homeProvider = context.watch<HomeProvider>();
    final sortAndFilterProvider = context.watch<SortAndFilterProvider>();
    return Container(
      padding: EdgeInsets.all(size.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(size.width * 0.06),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Filter Taps
            Center(
              child: GeneralText(
                text: 'Sort & Filter',
                sizeText: size.width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
            HeightSpace(space: 0.025),
            GeneralHomeFilterTap(items: AppLists.filtersTaps, selectedIndex: homeProvider.selectedFilter, onTap: homeProvider.changeFilter,),
            HeightSpace(space: 0.025),
            /// Price Range
            GeneralText(
              padding: EdgeInsets.only(bottom: size.height * 0.04),
              text: 'Price Range',
              sizeText: size.width * 0.045,
              fontWeight: FontWeight.w600,
            ),
            SortAndFilterPriceRange(),
            HeightSpace(space: 0.025),
            /// Sort Taps
            GeneralText(
              padding: EdgeInsets.only(bottom: size.height * 0.025),
              text: 'Sort by',
              sizeText: size.width * 0.045,
              fontWeight: FontWeight.w600,
            ),
            GeneralHomeFilterTap(items: AppLists.filtersSort, selectedIndex: sortAndFilterProvider.selectedSort, onTap: sortAndFilterProvider.changeSort,),
            HeightSpace(space: 0.025),
            /// Rating Taps
            GeneralText(
              padding: EdgeInsets.only(bottom: size.height * 0.025),
              text: 'Rating',
              sizeText: size.width * 0.045,
              fontWeight: FontWeight.w600,
            ),
            GeneralHomeFilterTap(items: AppLists.filtersRating, selectedIndex: sortAndFilterProvider.selectedRating, onTap: sortAndFilterProvider.changeRating,showStar: true,),
            HeightSpace(space: 0.04),
            /// Actions Button
            SortAndFilterActions(),
          ],
        ),
      ),
    );
  }
}
