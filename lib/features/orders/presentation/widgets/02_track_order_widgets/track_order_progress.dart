import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';

import '../../../../../core/widgets/general_text.dart';


class TrackOrderProgress extends StatelessWidget {
  const TrackOrderProgress({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        /// الصف العلوي (الأيقونات)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            StepIcon(icon: 'assets/image/general_image/box.png', isActive: true),
            StepIcon(icon: 'assets/image/general_image/cargo.png', isActive: true),
            StepIcon(icon: 'assets/image/order/delivery-man.png', isActive: false),
            StepIcon(icon: 'assets/image/general_image/open-box.png', isActive: false),
          ],
        ),
        HeightSpace1(space: 10),
        /// الصف السفلي (الدائرة + الخط)
        Row(
          children: [
            StepIndicator(isActive: currentStep >= 0),
            DashedLine(isActive: currentStep >= 1),
            StepIndicator(isActive: currentStep >= 1),
            DashedLine(isActive: currentStep >= 2),
            StepIndicator(isActive: currentStep >= 2),
            DashedLine(isActive: currentStep >= 3),
            StepIndicator(isActive: currentStep >= 3),
          ],
        ),

        GeneralText(
          padding: EdgeInsets.symmetric(vertical: 15),
          text: 'Packet In Delivery',
          sizeText: size.width * 0.045 ,
          fontWeight: FontWeight.w700,
        ),
        Divider(thickness: size.width * 0.005,color: Colors.grey[300],),
      ],
    );
  }
}



class StepIcon extends StatelessWidget {
  const StepIcon({
    super.key,
    required this.icon,
    required this.isActive,
  });

  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image.asset(
      icon,
      scale: size.width * 0.03,
      color: isActive ? Colors.black : Colors.grey,
    );
  }
}
class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.1008,
      child: Image.asset(
        'assets/image/order/done.png',
        scale:size.width * 0.065 ,
        color:isActive ? Colors.black : Colors.grey.shade300 ,
      ),
    );
  }
}
class DashedLine extends StatelessWidget {
  const DashedLine({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: List.generate(
          10,
              (index) => Expanded(
            child: Container(
              height: 1.5,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              color: isActive ? Colors.black : Colors.grey.shade300,
            ),
          ),
        ),
      ),
    );
  }
}




