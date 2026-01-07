import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/categories_product_detail_provider.dart';
import '../../../logic/home_provider.dart';


class GeneralHomeProductsGrid extends StatelessWidget {
  const GeneralHomeProductsGrid({super.key, required this.itemCount, required this.products});
  final int itemCount;
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context).colorScheme;

    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 20,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (_, index) {
        final product = products[index];
        return GestureDetector(
          onTap: (){
            context.read<CategoriesProductDetailProvider>().setProduct(product);
            context.push('/categoriesProductDetail');
          },
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: 170,
                  decoration: BoxDecoration(
                    color: theme.secondaryContainer,
                    borderRadius: BorderRadius.circular(size.width * 0.05),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(product['image'],width: size.width,height: size.height,),
                      ),
                      Positioned(
                        top: 12,
                        right: size.width * 0.03,
                        child: GestureDetector(
                          onTap: () => provider.toggleFavorite(products[index]['id']),
                          child: CircleAvatar(
                            backgroundColor: theme.primary,
                            radius: size.width * 0.038,
                            child: Icon(
                              size: size.width * 0.04,
                              provider.isFavorite(products[index]['id'])
                                  ? Icons.favorite_outlined
                                  : Icons.favorite_outline,
                              color: theme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                HeightSpace1(space: 7),
                GeneralText(
                  text: product['productName'],
                  sizeText: size.width * 0.039,
                  fontWeight: FontWeight.w700,
                ),
                HeightSpace1(space: 7),
                Row(
                  children: [
                    Icon(Icons.star, size: size.width * 0.035,),
                    GeneralText(padding:EdgeInsets.only(left: size.width * 0.01),text: '${product['rating']}  |',color: theme.onSurfaceVariant,fontWeight: FontWeight.w500),
                    WidthSpace(space: 0.01),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:size.width * 0.02,vertical:4),
                      margin: EdgeInsets.only(left: size.width * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: GeneralText(text: product['sold'], sizeText: size.width * 0.027,fontWeight: FontWeight.w500,color: Colors.black,),
                    ),
                  ],
                ),
                HeightSpace1(space: 7),
                GeneralText(
                  text: '\$${product['price']}.00',
                  sizeText: size.width * 0.045,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
