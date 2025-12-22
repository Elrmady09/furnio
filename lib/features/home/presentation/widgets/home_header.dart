import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        CircleAvatar(
          radius: size.width * 0.06,
          backgroundImage: AssetImage('assets/image/home/photo profile.jpg'),
        ),
        WidthSpace(space: 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralText(
              text: 'Good Morning 👋',
              sizeText: size.width * 0.035,
              color: Colors.grey,
            ),
            GeneralText(
              text: 'Andrew Ainsley',
              sizeText: size.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        const Spacer(),
        IconButton(onPressed: () => context.push('/notifications'), icon: Icon(Icons.notifications_none),),
        WidthSpace(space: 0.03),
        IconButton(onPressed: () => context.push('/favorite'), icon: Icon(Icons.favorite_border),),
      ],
    );
  }
}
