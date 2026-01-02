import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/features/profile/logic/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/space.dart';
import '../../widgets/04_security_widgets/security_switch_item.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'Security'),
              SecuritySwitchItem(
                title: 'Remember me',
                value: provider.rememberMe,
                onChanged: provider.toggleRemember,
              ),
              SecuritySwitchItem(
                title: 'Face ID',
                value: provider.faceId,
                onChanged: provider.toggleFaceId,
              ),
              SecuritySwitchItem(
                title: 'Biometric ID',
                value: provider.biometric,
                onChanged: provider.toggleBiometric,
              ),
              SecuritySwitchItem(
                title: 'Google Authentication',
                showSwitch: false,
              ),
              HeightSpace(space: 0.04),
              GeneralButton(
                text: 'Change PIN',
                bgColor: Colors.grey[300],
                showShadow: false,
                textColor: Colors.black,
              ),
              HeightSpace(space: 0.03),
              GeneralButton(
                text: 'Change Password',
                bgColor: Colors.grey[300],
                showShadow: false,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
