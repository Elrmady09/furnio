import 'package:flutter/material.dart';
import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../data/notifications_data.dart';
import 'notification_card.dart';


class NotificationsListSection extends StatelessWidget {
  const NotificationsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final notification = itemNotifications;
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: notification.entries.map((section) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralText(
              text: section.key,
              sizeText: size.width * 0.045,
              fontWeight: FontWeight.w600,
            ),
            HeightSpace1(space: 14),

            ...section.value.map(
                  (item) => Padding(
                padding: EdgeInsets.only(bottom: 14),
                child: NotificationCard(
                  title: item['title']!,
                  subtitle: item['subtitle']!,
                  icon: item['icon']!,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
