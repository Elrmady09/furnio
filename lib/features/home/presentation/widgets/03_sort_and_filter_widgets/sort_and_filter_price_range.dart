import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:furnio/features/home/presentation/widgets/03_sort_and_filter_widgets/price_range_bubble.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/filter_provider.dart';



class SortAndFilterPriceRange extends StatelessWidget {
  const SortAndFilterPriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<SortAndFilterProvider>();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        PriceRangeBubble(
          value: provider.priceRange.start,
          left: provider.startPercent * (size.width * 0.75),
        ),
        PriceRangeBubble(
          value: provider.priceRange.end,
          left: provider.endPercent * (size.width * 0.75),
        ),
        RangeSlider(
          values: provider.priceRange,
          min: provider.minPrice,
          max: provider.maxPrice,
          onChanged: provider.changePrice,
        ),
      ],
    );
  }
}


