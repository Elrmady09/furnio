import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import '../../../../../core/widgets/space.dart';
import '../../widgets/01_notifications_widgets/notifications_list_section.dart';



class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralHeader(title: 'Notification',trailing: Icon(Icons.list),),
              HeightSpace(space: 0.03),

              const Expanded(
                child: NotificationsListSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
