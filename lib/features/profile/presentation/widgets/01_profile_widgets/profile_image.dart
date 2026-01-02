import 'package:flutter/material.dart';
import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';


class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: size.width * 0.15,
              backgroundImage: AssetImage(
                'assets/image/home/photo profile.jpg',
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: size.width * 0.04,
                backgroundColor: Colors.black,
                child: Icon(Icons.edit, color: Colors.white, size: size.width * 0.04),
              ),
            ),
          ],
        ),
        HeightSpace(space: 0.015),
        GeneralText(
          text: 'Andrew Ainsley',
          sizeText: size.width * 0.045,
          fontWeight: FontWeight.w600,
        ),
        HeightSpace(space: 0.005),
        GeneralText(
          text: '+111 467 378 399',
          sizeText: size.width * 0.035,
          color: Colors.grey,
        ),
      ],
    );
  }
}
