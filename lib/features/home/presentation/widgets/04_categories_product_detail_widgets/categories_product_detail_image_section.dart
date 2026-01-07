import 'package:flutter/material.dart';
import 'package:furnio/features/home/logic/categories_product_detail_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategoriesProductDetailImageSection extends StatelessWidget {
  const CategoriesProductDetailImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<CategoriesProductDetailProvider>();

    return SizedBox(
      height: 240,
      child: Stack(
        children: [
          PageView.builder(
            controller: provider.pageController,
            itemCount: 4,
            itemBuilder: (context,index){
              return Container(
                height: size.height ,
                width: double.infinity,
                color: Color(0xfff3f3f3),
                child: Image.asset(
                  provider.image,
                  scale: size.width * 0.012,
                ),
              );
            },
          ),

          Positioned(
            left: size.width * 0.05,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(context),
            ),
          ),

          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller:provider.pageController ,
                count: 4,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: size.width * 0.08,
                    height: 10,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(size.width * 0.1),
                  ),
                  dotDecoration: DotDecoration(
                    width: 10,
                    height: 10,
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(size.width * 0.5),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
