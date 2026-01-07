import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../logic/checkout_provider.dart';

class CheckoutPromoCode extends StatelessWidget {
  const CheckoutPromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    final promoCode = context.watch<CheckoutProvider>().selectedPromoCode;
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        if(promoCode != null)...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06,vertical: 11),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25)
            ),
            child: Row(
              children: [
                GeneralText(
                  padding: EdgeInsets.only(right: size.width * 0.05),
                  text: promoCode['title'] ?? '',
                  color: Colors.white,
                  sizeText: size.width * 0.04,
                  fontWeight: FontWeight.w500
                ),
                GestureDetector(
                    onTap: (){
                      context.read<CheckoutProvider>().deletePromoCode();
                    },
                    child: Icon(Icons.close,color: Colors.white,)
                ),

              ],
            ),
          ),
        ]else...[
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04,vertical: 15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                ),
                child: GeneralText(
                  text: 'Add Promo Code',
                  color: Colors.grey,
                  sizeText: size.width * 0.038,
                  fontWeight: FontWeight.w500,
                ),
              )
          ),
        ],
        WidthSpace(space: 0.03),
        GestureDetector(
          onTap: (){
            context.push('/promoCode');
          },
          child: Container(
            height: size.width * 0.12,
            width: size.width * 0.12,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add,color: Colors.white,),
          ),
        ),
      ],
    );
  }
}
