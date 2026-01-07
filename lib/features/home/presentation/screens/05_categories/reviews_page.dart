import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_lists.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/features/home/presentation/widgets/00_general_home_widgets/general_home_filter_tap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/space.dart';
import '../../../logic/categories_product_detail_provider.dart';
import '../../widgets/05_reviews_widgets/reviews_list.dart';



class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<CategoriesProductDetailProvider>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralHeader(title: '4.7 (7,376 reviews)',trailing: Icon(Icons.search),),
              HeightSpace1(space: 7),
              GeneralHomeFilterTap(
                items: AppLists.filtersRating,
                selectedIndex: provider.selectedRating == -1 ? 0 : 6-provider.selectedRating ,
                onTap: (index) {
                  if (index == 0) {
                    provider.changeRating(-1); // All
                  } else {
                    provider.changeRating(6 - index); // 5..1
                  }
                },
                showStar: true,
              ),
              HeightSpace1(space: 15),
              const Expanded(child: ReviewsList()),
            ],
          ),
        ),
      ),
    );
  }
}
