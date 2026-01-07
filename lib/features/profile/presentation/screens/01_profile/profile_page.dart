import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/header/general_header_with_logo.dart';

import '../../../../../core/widgets/space.dart';
import '../../widgets/01_profile_widgets/profile_image.dart';
import '../../widgets/01_profile_widgets/profile_menu_list.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeaderWithLogo(title: 'Profile'),
              HeightSpace1(space:15),
              ProfileImage(),
              HeightSpace1(space: 15),
              ProfileMenuList(),
            ],
          ),
        ),
      ),
    );
  }
}
