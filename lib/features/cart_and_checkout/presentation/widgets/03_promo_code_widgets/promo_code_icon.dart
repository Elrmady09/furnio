import 'package:flutter/material.dart';

class PromoCodeIcon extends StatelessWidget {
  const PromoCodeIcon({super.key});

  Widget _circleContainer({required double radius}){

    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.black,
    );

  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.12,
      width: size.width * 0.2,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: size.width * 0.12,
            height: size.width * 0.12,
            //padding: padding,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Image.asset('assets/image/cart_and_checkout/promo.png',color: Colors.white,scale: size.width * 0.04,),
          ),
          /// Start from top left
          Positioned(
              top: size.height * 0.01,
              left: size.width * 0.01,
              child: _circleContainer(radius: size.width * 0.013)
          ),
          Positioned(
              top: size.height * 0.055,
              left: size.width * 0.01,
              child: _circleContainer(radius: size.width * 0.003)
          ),
          Positioned(
              bottom: size.height * 0.03,
              left: size.width * 0.025,
              child: _circleContainer(radius: size.width * 0.005)
          ),
          Positioned(
              bottom: size.height * 0.005,
              left: 0,
              right: size.width * 0.01,
              child: _circleContainer(radius: size.width * 0.005)
          ),
          Positioned(
              bottom: size.height * 0.02,
              right: size.width * 0.04,
              child: _circleContainer(radius: size.width * 0.003)
          ),
          Positioned(
              bottom: size.height * 0.05,
              right: size.width * 0.01,
              child: _circleContainer(radius: size.width * 0.005)
          ),
          Positioned(
              bottom: size.height * 0.09,
              right: size.width * 0.032,
              child: _circleContainer(radius: size.width * 0.009)
          ),
          Positioned(
              top: size.height * 0.01,
              right: size.width * 0.1,
              child: _circleContainer(radius: size.width * 0.004)
          ),
          Positioned(
              top: size.height * 0.015,
              right: size.width * 0.2,
              child: _circleContainer(radius: size.width * 0.008)
          ),
          /// end to top right

        ],
      ),
    );
  }
}
