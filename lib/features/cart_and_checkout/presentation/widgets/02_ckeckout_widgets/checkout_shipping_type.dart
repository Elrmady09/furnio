import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/checkout_provider.dart';

class CheckoutShippingType extends StatelessWidget {
  const CheckoutShippingType({super.key});

  @override
  Widget build(BuildContext context) {
    final shipping = context.watch<CheckoutProvider>().selectedShipping;
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        context.push('/chooseShipping');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.025,vertical: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(size.width * 0.03),
        ),
        child: Row(
          children: [
            if(shipping != null)...[
              CircleAvatar(
                radius: size.width * 0.06,
                backgroundColor: Colors.grey[300],
                child: Container(
                  width: size.width * 0.08,
                  height: size.width * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle
                  ),
                  child:Image.asset(shipping['icon'] ?? '',scale: size.width * 0.06,color: Colors.white,),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralText(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    text: shipping['title'] ?? '',
                    sizeText: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  GeneralText(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    text: shipping['subtitle'] ?? '',
                    sizeText: size.width * 0.035,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              GeneralText(
                padding: EdgeInsets.only(left: size.width * 0.06,right: size.width * 0.04),
                text: '\$${shipping['price']}',
                sizeText: size.width * 0.048,
                fontWeight: FontWeight.w900,
              ),
              Icon(Icons.edit,),
            ]else...[
              Icon(Icons.local_shipping,),
              GeneralText(
                padding: EdgeInsets.only(left: size.width * 0.03),
                text: 'Choose Shipping Type',
                sizeText: size.width * 0.04,
                fontWeight: FontWeight.w500,
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, size: size.width * 0.04,),
            ],
          ],
        )
      ),
    );
  }
}

