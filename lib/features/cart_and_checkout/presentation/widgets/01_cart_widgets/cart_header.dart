import 'package:flutter/material.dart';

import '../../../../../core/constants/app_padding.dart';
import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';


class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppPadding.pagePadding(context),
      child: Row(
        children: [
          Image.asset('assets/image/splash/furnio icon.png',scale: size.width * 0.06,),
          WidthSpace(space: 0.03),
          GeneralText(
            text: 'My Cart',
            sizeText: size.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
          Spacer(),
          Icon(Icons.search),
        ],
      ),
    );
  }
}
