import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:furnio/features/profile/logic/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_padding.dart';
import '../../../../../core/widgets/general_header.dart';
import '../../widgets/05_language_widgets/language_item.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();

    final languages = [
      'English (US)',
      'English (UK)',
      'Mandarin',
      'Hindi',
      'Spanish',
      'French',
      'Arabic',
      'Bengali',
      'Russian',
      'Indonesia',
    ];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'Language'),
              HeightSpace1(space: 14),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];

                    return LanguageItem(
                      title: lang,
                      value: provider.selectedLanguage == lang,
                      onTap: () => provider.changeLanguage(lang),
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
