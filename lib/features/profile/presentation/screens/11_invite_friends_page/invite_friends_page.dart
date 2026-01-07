import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/space.dart';

import '../../../data/friends_data.dart';
import '../../widgets/07_invite_friends_widgets/invite_friend_item.dart';

class InviteFriendsPage extends StatelessWidget {
  const InviteFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'Invite Friends'),
              HeightSpace1(space: 15),
              Expanded(
                child: ListView.builder(
                  itemCount:friends.length ,
                  itemBuilder: (_, index) {
                    final friend = friends[index];
                    return InviteFriendItem(
                      image: friend['image']!,
                      name:friend['name']!,
                      phone:friend['phone']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
