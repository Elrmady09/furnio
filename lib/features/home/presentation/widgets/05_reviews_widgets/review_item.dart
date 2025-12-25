import 'package:flutter/material.dart';
import 'package:furnio/features/home/logic/categories_product_detail_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';



class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<CategoriesProductDetailProvider>();
    final reviews = provider.filteredReviews;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        WidthSpace(space: 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: size.width * 0.06,
                    backgroundImage: const AssetImage('assets/image/home/photo profile.jpg'),
                  ),
                  WidthSpace(space: 0.035),
                  GeneralText(
                    text: reviews[index].userName,
                    fontWeight: FontWeight.w600,
                    sizeText: size.width * 0.04,
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.035,
                      vertical: size.height * 0.007,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      border: Border.all(width:size.width * 0.005,color: Colors.black)
                    ),
                    child: Row(
                      children:[
                        Icon(Icons.star, size: size.width * 0.035, color: Colors.black),
                        WidthSpace(space: 0.015),
                        GeneralText(text: reviews[index].rating.toString(),fontWeight: FontWeight.w700,)

                      ],
                    ),
                  ),
                  WidthSpace(space: 0.03),
                  Image.asset('assets/image/home/more.png',scale: size.width * 0.05,),

                ],
              ),
              HeightSpace(space: 0.015),
              GeneralText(
                text:
                reviews[index].comment,
                sizeText: size.width * 0.036,
                color: Colors.grey[700],
                fontWeight: FontWeight.w400,
              ),
              HeightSpace(space: 0.015),
              Row(
                children: [
                  Icon(Icons.favorite_border, size: size.width * 0.06),
                  WidthSpace(space: 0.02),
                  GeneralText(text: '729', sizeText: size.width * 0.032,fontWeight: FontWeight.w700,),
                  WidthSpace(space: 0.05),
                  GeneralText(
                    text: reviews[index].time,
                    sizeText: size.width * 0.03,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              HeightSpace(space: 0.015),
            ],
          ),
        ),
      ],
    );
  }
}
