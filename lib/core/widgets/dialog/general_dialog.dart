
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../general_second_button.dart';



class GeneralDialog extends StatelessWidget {
  const GeneralDialog({super.key, required this.icon, this.title, this.description,this.showActions = false, this.blackButtonTitle, this.greyButtonTitle, this.blackButtonOnTap, this.greyButtonOnTap});
  final IconData icon;
  final String? title;
  final String? description;
  final bool showActions;
  final String? blackButtonTitle;
  final String? greyButtonTitle;
  final VoidCallback? blackButtonOnTap;
  final VoidCallback? greyButtonOnTap;

  Widget _circleContainer({required double radius,required Color color,}){


    return CircleAvatar(
      radius: radius,
      backgroundColor: color,

    );

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context).colorScheme;
    final circleColor = theme.primary;

    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150,
              width: size.width * 0.45,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: size.width * 0.29,
                    height: size.width * 0.29,
                    //padding: padding,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.primary,
                    ),
                    child: Icon(icon,size: size.width * 0.15,color: theme.onPrimary,),
                  ),
                  /// Start from top left
                  Positioned(
                      top: 15,
                      left: size.width * 0.05,
                      child: _circleContainer(radius: size.width * 0.02,color: circleColor)
                  ),
                  Positioned(
                      top: 70,
                      left: size.width * 0.03,
                      child: _circleContainer(radius: size.width * 0.003,color: circleColor)
                  ),
                  Positioned(
                      bottom: 53,
                      left: size.width * 0.01,
                      child: _circleContainer(radius: size.width * 0.006,color: circleColor)
                  ),
                  Positioned(
                      bottom: 30,
                      left: size.width * 0.05,
                      child: _circleContainer(radius: size.width * 0.01,color: circleColor)
                  ),
                  Positioned(
                      bottom: 7,
                      left: 0,
                      right: 0,
                      child: _circleContainer(radius: size.width * 0.007,color: circleColor)
                  ),
                  Positioned(
                      bottom: 20,
                      right: size.width * 0.13,
                      child: _circleContainer(radius: size.width * 0.004,color: circleColor)
                  ),
                  Positioned(
                      bottom: 40,
                      right: size.width * 0.05,
                      child: _circleContainer(radius: size.width * 0.007,color: circleColor)
                  ),
                  Positioned(
                      bottom: 75,
                      right: size.width * 0.025,
                      child: _circleContainer(radius: size.width * 0.007,color: circleColor)
                  ),
                  Positioned(
                      top: 25,
                      right: size.width * 0.05,
                      child: _circleContainer(radius: size.width * 0.015,color: circleColor)
                  ),
                  Positioned(
                      top: 8,
                      right: size.width * 0.2,
                      child: _circleContainer(radius: size.width * 0.008,color: circleColor)
                  ),
                  /// end to top right

                ],
              ),
            ),
            HeightSpace1(space: 14),
            GeneralText(
              text: title ?? 'Congratulations!',
              sizeText:size.width * 0.055,
              fontWeight: FontWeight.bold,
            ),
            HeightSpace1(space: 14),
            GeneralText(
              textAlign: TextAlign.center,
              text: description ?? 'Your account is ready to use. You will\nbe redirected to the Home page in a\nfew seconds... ',
            ),
            if(showActions == true)...[
              Column(
                children: [
                  HeightSpace1(space: 15),
                  GeneralSecondButton(title: blackButtonTitle ?? 'View Order',bgColor: Colors.black,titleColor: Colors.white,onTap: blackButtonOnTap ??  ()=> context.go('/mainLayout')),
                  GeneralSecondButton(title: greyButtonTitle ?? 'View E-Receipt',bgColor: Colors.grey[300],titleColor: Colors.black,onTap: greyButtonOnTap,),

                ],
              ),
            ]else...[
              HeightSpace1(space: 38),
              CircularProgressIndicator(),
            ]





          ],
        ),
      ),
    );
  }
}
