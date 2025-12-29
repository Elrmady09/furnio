import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.image, required this.name, required this.price, required this.date, required this.type, this.onTap});
  final String image;
  final String name;
  final String price;
  final String date;
  final String type;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.015,vertical: size.height * 0.01),
              width: size.width * 0.15,
              height: size.width * 0.15,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle
              ),
              child: Image.asset(image),
            ),
            WidthSpace(space: 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralText(
                    text: name,
                    sizeText: size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                  GeneralText(
                    text: date,
                    sizeText: size.width * 0.03,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                GeneralText(
                  text: price,
                  sizeText: size.width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    GeneralText(
                      padding: EdgeInsets.only(right: size.width * 0.01),
                      text: type,
                      sizeText: size.width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                    Image.asset('assets/image/wallet/up-arrow.png',scale: size.width * 0.06,color: Colors.deepOrange,),
                  ],
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
