import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/constants/app_text.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/space.dart';

import '../../widgets/06_privacy_policy_widgets/privacy_section.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'Privacy Policy'),
              HeightSpace1(space: 5),
              Expanded(
                child: ListView(
                  children: [
                    PrivacySection(
                      title: AppText.privacyTitle1,
                      content: AppText.privacyContent1,
                    ),
                    PrivacySection(
                      title: AppText.privacyTitle2,
                      content: AppText.privacyContent1,
                    ),
                    PrivacySection(
                      title: AppText.privacyTitle3,
                      content:AppText.privacyContent1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
