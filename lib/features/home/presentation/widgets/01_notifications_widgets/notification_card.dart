import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';


class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: theme.secondaryContainer,
        borderRadius: BorderRadius.circular(size.width * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 7,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: size.width * 0.07,
            backgroundColor: theme.primary,
            child: Image.asset(icon, width: size.width * 0.065,color: theme.onPrimary,),
          ),
          WidthSpace(space: 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralText(
                text: title,
                sizeText: size.width * 0.04,
                fontWeight: FontWeight.w600,
              ),
              HeightSpace1(space: 3),
              GeneralText(
                text: subtitle,
                sizeText: size.width * 0.032,
                color: theme.onSurfaceVariant,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
