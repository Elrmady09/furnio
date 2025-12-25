import 'package:flutter/material.dart';
import 'package:furnio/features/home/logic/categories_product_detail_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';

class CategoriesProductDetailRatingSection extends StatelessWidget {
  const CategoriesProductDetailRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<CategoriesProductDetailProvider>();

    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal:size.width * 0.02,vertical: size.height * 0.005),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
          child: GeneralText(
            text: provider.sold,
            fontWeight: FontWeight.w500,
            sizeText: size.width * 0.03,
          ),
        ),
        WidthSpace(space: 0.03),
        Icon(Icons.star, color: Colors.black, size: size.width * 0.06),
        GestureDetector(
          onTap: (){
            context.push('/reviews');
          },
          child: GeneralText(
            padding: EdgeInsets.only(top: size.height * 0.005,left: size.width * 0.01),
            text: '${provider.rating} (5,673 reviews)',
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
            sizeText: size.width * 0.035,
          ),
        ),
      ],
    );
  }
}
