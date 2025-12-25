import 'package:flutter/material.dart';
import 'package:furnio/features/home/presentation/widgets/05_reviews_widgets/review_item.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/space.dart';
import '../../../logic/categories_product_detail_provider.dart';



class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final length = context.watch<CategoriesProductDetailProvider>().filteredReviews;
    return ListView.separated(
      itemCount: length.length,
      separatorBuilder: (_, __) => HeightSpace(space: 0.02),
      itemBuilder: (context, index) {
        return ReviewItem(index: index,);
      },
    );
  }
}
