import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_lists.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/constants/app_text.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/tabs/general_tab_item.dart';
import 'package:furnio/features/profile/logic/profile_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/space.dart';
import '../../../../home/presentation/widgets/00_general_home_widgets/general_home_filter_tap.dart';
import '../../../../home/presentation/widgets/00_general_home_widgets/general_home_search.dart';
import '../../widgets/08_help_center_widgets/contact_item.dart';
import '../../widgets/08_help_center_widgets/faq_item.dart';



class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    return SafeArea(
      child: GestureDetector(
        onTap: provider.unFocus,
        child: Scaffold(
          body: Padding(
            padding: AppPadding.pagePadding(context),
            child: Column(
              children: [
                GeneralHeader(title: 'Help Center'),
                GeneralAnimatedTabs(titleOne: 'FAQ', titleTwo: 'Contact us', indexOne: 0, indexTwo: 1,),
                if (provider.selectedTab == 0) ...[
                  GeneralHomeFilterTap(items: AppLists.filtersTapsProfile, selectedIndex: provider.selectedCategory, onTap: provider.changeCategory,),
                  HeightSpace1(space: 20),
                  GeneralHomeSearch(
                    textEditingController: provider.searchController,
                    focusNode: provider.searchFocusNode,
                    onTap: provider.openSearch,
                    showFilterSearch: false,
                  ),
                  HeightSpace1(space: 10),
                  Expanded(
                    child: ListView(
                      children:  [
                        FAQItem(
                          title: AppText.helpQuestion1,
                          content: AppText.helpAnswer1,
                        ),
                        FAQItem(
                          title: AppText.helpQuestion2,
                          content: AppText.helpAnswer2,
                        ),
                        FAQItem(
                          title: AppText.helpQuestion3,
                          content: AppText.helpAnswer3,
                        ),
                        FAQItem(
                          title: AppText.helpQuestion4,
                          content: AppText.helpAnswer4,
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  Expanded(
                    child: ListView(
                      children: [
                        ContactItem(
                          icon: Icons.headphones,
                          title: 'Customer Service',
                          onTap: () => context.push('/chat'),
                        ),
                        ContactItem(icon: Icons.chat, title: 'WhatsApp'),
                        ContactItem(icon: Icons.language, title: 'Website'),
                        ContactItem(icon: Icons.facebook, title: 'Facebook'),
                        ContactItem(icon: Icons.close, title: 'Twitter'),
                        ContactItem(icon: Icons.camera_alt, title: 'Instagram'),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
