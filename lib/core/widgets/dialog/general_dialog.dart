
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../general_second_button.dart';



class GeneralDialog extends StatelessWidget {
  const GeneralDialog({super.key, required this.icon, this.title, this.description,this.showActions = false});
  final IconData icon;
  final String? title;
  final String? description;
  final bool showActions;

  Widget _circleContainer({required double radius}){

    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.black,
    );

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: size.height * 0.07),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height * 0.25,
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
                      color: Colors.black,
                    ),
                    child: Icon(icon,size: size.width * 0.15,color: Colors.white,),
                  ),
                  /// Start from top left
                  Positioned(
                      top: size.height * 0.02,
                      left: size.width * 0.05,
                      child: _circleContainer(radius: size.width * 0.02)
                  ),
                  Positioned(
                      top: size.height * 0.1,
                      left: size.width * 0.02,
                      child: _circleContainer(radius: size.width * 0.003)
                  ),
                  Positioned(
                      bottom: size.height * 0.05,
                      left: size.width * 0.05,
                      child: _circleContainer(radius: size.width * 0.01)
                  ),
                  Positioned(
                      bottom: size.height * 0.01,
                      left: 0,
                      right: 0,
                      child: _circleContainer(radius: size.width * 0.007)
                  ),
                  Positioned(
                      bottom: size.height * 0.03,
                      right: size.width * 0.13,
                      child: _circleContainer(radius: size.width * 0.004)
                  ),
                  Positioned(
                      bottom: size.height * 0.05,
                      right: size.width * 0.05,
                      child: _circleContainer(radius: size.width * 0.007)
                  ),
                  Positioned(
                      bottom: size.height * 0.1,
                      right: size.width * 0.06,
                      child: _circleContainer(radius: size.width * 0.007)
                  ),
                  Positioned(
                      top: size.height * 0.035,
                      right: size.width * 0.05,
                      child: _circleContainer(radius: size.width * 0.015)
                  ),
                  Positioned(
                      top: size.height * 0.015,
                      right: size.width * 0.2,
                      child: _circleContainer(radius: size.width * 0.008)
                  ),
                  /// end to top right

                ],
              ),
            ),
            HeightSpace(space: 0.02),
            GeneralText(
              text: title ?? 'Congratulations!',
              sizeText:size.width * 0.055,
              fontWeight: FontWeight.bold,
            ),
            HeightSpace(space: 0.02),
            GeneralText(
              textAlign: TextAlign.center,
              text: description ?? 'Your account is ready to use. You will\nbe redirected to the Home page in a\nfew seconds... ',
            ),
            if(showActions == true)...[
              Column(
                children: [
                  HeightSpace(space: 0.02),
                  GeneralSecondButton(title: 'View Order',bgColor: Colors.black,titleColor: Colors.white,onTap: ()=> context.go('/myOrder')),
                  GeneralSecondButton(title: 'View E-Receipt',bgColor: Colors.grey[300],titleColor: Colors.black,),

                ],
              ),
            ]else...[
              HeightSpace(space: 0.05),
              CircularProgressIndicator(),
            ]





          ],
        ),
      ),
    );
  }
}
