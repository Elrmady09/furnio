import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/checkout_provider.dart';

class CheckoutShippingAddress extends StatelessWidget {
  const CheckoutShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final address = context.watch<CheckoutProvider>().selectedAddress;
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          text: 'Shipping Address',
          sizeText: size.width * 0.045,
          fontWeight: FontWeight.w700,
        ),
        HeightSpace1(space: 10),
        GestureDetector(
          onTap: (){
            context.push('/shippingAddress');
          },
          child: Container(
            padding: EdgeInsets.all(size.width * 0.04),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
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
                    child:Icon(Icons.location_on,color: Colors.white,size: size.width * 0.05,),
                  ),
                ),
                WidthSpace(space: 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GeneralText(
                        text: address['title'] ?? '',
                        sizeText: size.width * 0.04,
                        fontWeight: FontWeight.w700,
                      ),
                      GeneralText(
                        text: address['subtitle'] ?? '',
                        sizeText: size.width * 0.032,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.edit),
              ],
            ),
          ),
        ),
        HeightSpace1(space: 10),
        Divider(thickness: size.width * 0.005,color: Colors.grey[300],),
        HeightSpace1(space: 5),
      ],
    );
  }
}
