import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_text.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context).colorScheme;
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 25),
        height: 250,
        child: Column(
          children: [
            Image.asset('assets/image/general_image/no-internet.png',scale: 6,),
            GeneralText(
              padding: EdgeInsets.only(top: 12),
              text: 'No Internet Connection',
              sizeText: 18,
              fontWeight: FontWeight.w500,

            ),
            GeneralText(
              padding: EdgeInsets.only(top: 5),
              textAlign: TextAlign.center,
              text: 'Please check your internet connection and try again.',
              sizeText: 14,
            ),
          ],
        ),
      ),

    );
  }
}
