import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../data/home_categories_data.dart';
class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: size.height * 0.01,
      ),
      itemBuilder: (_, index) {
        final categories = itemHomeCategories[index] ;
        return Column(
          children: [
            GestureDetector(
              onTap: (){
                context.push('/categories',extra: categories['title'],);
              },
              child: Container(
                width: size.width * 0.15,
                height: size.width * 0.15,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Image.asset(categories['image'],scale: size.width * 0.04,),
              ),
            ),
            HeightSpace(space: 0.01),
            GeneralText(
              text: categories['title'],
              sizeText: size.width * 0.038,
              fontWeight: FontWeight.w500,
            ),
          ],
        );
      },
    );
  }
}
