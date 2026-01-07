import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/home_provider.dart';
import 'recent_search_item.dart';

class RecentSearchBox extends StatelessWidget {
  const RecentSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context).colorScheme;

    if (!provider.isSearching || provider.recentSearches.isEmpty) {
      return const SizedBox();
    }

    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: theme.secondaryContainer,
        borderRadius: BorderRadius.circular(size.width * 0.04),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GeneralText(
                text: 'Recent Search',
                sizeText: size.width * 0.04,
                fontWeight: FontWeight.w600,

              ),
              GestureDetector(
                onTap: provider.clearAll,
                child: GeneralText(
                  text: 'Clear',
                  sizeText: size.width * 0.035,
                  color:theme.onSurfaceVariant ,
                ),
              ),
            ],
          ),
          HeightSpace1(space: 7),
          ...List.generate(
            provider.recentSearches.length,
                (index) => RecentSearchItem(
              text: provider.recentSearches[index],
            ),
          ),
        ],
      ),
    );
  }
}
