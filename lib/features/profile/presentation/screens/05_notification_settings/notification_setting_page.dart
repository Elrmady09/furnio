import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';

import '../../widgets/02_notification/notification_item.dart';

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = [
      'General Notification',
      'Sound',
      'Vibrate',
      'Special Offers',
      'Promo & Discount',
      'Payments',
      'App Updates',
    ];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'notification'),
              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index){
                    return NotificationItem(title: notifications[index],);
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
