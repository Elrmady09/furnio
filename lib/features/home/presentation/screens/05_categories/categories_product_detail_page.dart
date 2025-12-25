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
        body: SingleChildScrollView(
          child: Column(
            children:[
              /// Image
              CategoriesProductDetailImageSection(),
              Padding(
                padding:AppPadding.pagePadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name AND Favorites
                    CategoriesProductDetailTitleSection(),
                    /// Sold AND Reviews
                    CategoriesProductDetailRatingSection(),
                    HeightSpace(space: 0.015),
                    Divider(thickness: size.width * 0.005,color: Colors.grey[200],),
                    HeightSpace(space: 0.01),
                    /// Description
                    CategoriesProductDetailDescriptionSection(),
                    HeightSpace(space: 0.02),
                    /// Color
                    CategoriesProductDetailColorSelector(),
                    HeightSpace(space: 0.02),
                    /// Quantity
                    CategoriesProductDetailQuantitySelector(),
                    HeightSpace(space: 0.015),
                    Divider(thickness: size.width * 0.005,color: Colors.grey[200],),
                    HeightSpace(space: 0.015),
                    /// Price
                    CategoriesProductDetailPriceSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
