import 'package:flutter/material.dart';
import 'package:furnio/features/profile/presentation/widgets/01_profile_widgets/profile_switch_item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../logic/profile_provider.dart';
import '../10_logout_widget/logout_bottom_sheet.dart';
import 'profile_menu_item.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();

    return Expanded(
      child: ListView(
        children: [
          ProfileMenuItem(title: 'Edit Profile', icon: Icons.person,onTap: ()=> context.push('/editProfile'),),
          ProfileMenuItem(title: 'Address', icon: Icons.location_on,onTap: ()=> context.push('/address'),),
          ProfileMenuItem(title: 'Notification', icon: Icons.notifications,onTap: ()=> context.push('/notificationSetting'),),
          ProfileMenuItem(title: 'Payment', icon: Icons.payment,onTap: ()=> context.push('/Payment'),),
          ProfileMenuItem(title: 'Security', icon: Icons.security,onTap: ()=> context.push('/security'),),
          ProfileMenuItem(
            title: 'Language',
            icon: Icons.language,
            trailingText: 'English (US)',
            onTap: ()=> context.push('/language'),
          ),
          ProfileSwitchItem(
            title: 'Dark Mode',
            icon: Icons.dark_mode,
            value: provider.isDarkMode,
            onChanged: provider.toggleDarkMode,
          ),
          ProfileMenuItem(title: 'Privacy Policy', icon: Icons.privacy_tip,onTap: ()=> context.push('/privacyPolicy'),),
          ProfileMenuItem(title: 'Help Center', icon: Icons.help,onTap: ()=> context.push('/helpCenter'),),
          ProfileMenuItem(title: 'Invite Friends', icon: Icons.group,onTap: ()=> context.push('/inviteFriends'),),
          ProfileMenuItem(
            title: 'Logout',
            icon: Icons.logout,
            color: Colors.red,
            onTap: (){
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const LogoutBottomSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}
