import 'package:flutter/material.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';

class OrdersHeader extends StatelessWidget {
  const OrdersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Image.asset('assets/image/splash/furnio icon.png',scale: size.width * 0.06,),
        GeneralText(
          padding: EdgeInsets.only(left: size.width * 0.03),
          text: 'My Orders',
          sizeText: size.width * 0.05,
          fontWeight: FontWeight.w700,
        ),
        Spacer(),
        Icon(Icons.search),
        WidthSpace(space: 0.03),
        Icon(Icons.more_vert)
      ],
    );
  }
}
