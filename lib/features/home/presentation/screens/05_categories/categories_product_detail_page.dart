import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/features/home/presentation/widgets/04_categories_product_detail_widgets/categories_product_detail_color_selector.dart';
import 'package:furnio/features/home/presentation/widgets/04_categories_product_detail_widgets/categories_product_detail_description_section.dart';
import 'package:furnio/features/home/presentation/widgets/04_categories_product_detail_widgets/categories_product_detail_image_section.dart';
import 'package:furnio/features/home/presentation/widgets/04_categories_product_detail_widgets/categories_product_detail_price_section.dart';
import 'package:furnio/features/home/presentation/widgets/04_categories_product_detail_widgets/categories_product_detail_quantity_selector.dart';
import 'package:furnio/features/home/presentation/widgets/04_categories_product_detail_widgets/categories_product_detail_rating_section.dart';
import 'package:furnio/features/home/presentation/widgets/04_categories_product_detail_widgets/categories_product_detail_title_section.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/space.dart';
import '../../../logic/categories_product_detail_provider.dart';

class CategoriesProductDetailPage extends StatelessWidget {
  const CategoriesProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final provider = context.watch<CategoriesProductDetailProvider>();
    if (provider.product == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            /// Image
            SliverToBoxAdapter(
              child: CategoriesProductDetailImageSection(),
            ),

            /// Content
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPadding.pagePadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesProductDetailTitleSection(),
                    CategoriesProductDetailRatingSection(),
                    HeightSpace1(space: 12),
                    Divider(thickness: size.width * 0.005, color: Colors.grey[200],),
                    HeightSpace1(space: 7),
                    CategoriesProductDetailDescriptionSection(),
                    HeightSpace1(space: 14),
                    CategoriesProductDetailColorSelector(),
                    HeightSpace1(space: 14),
                    CategoriesProductDetailQuantitySelector(),
                    HeightSpace1(space: 14),
                    Divider(thickness: size.width * 0.005, color: Colors.grey[200],),

                  ],
                ),
              ),
            ),

            /// ✅ Price fills remaining space
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: AppPadding.pagePadding(context),
                child: CategoriesProductDetailPriceSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
