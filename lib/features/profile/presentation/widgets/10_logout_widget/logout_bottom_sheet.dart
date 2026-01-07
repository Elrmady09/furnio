import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_second_button.dart';
import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/profile_provider.dart';


class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(size.width * 0.08),
        ),
      ),
      child: Column(

        children: [
          /// drag handle
          Center(
            child: Container(
              width: size.width * 0.15,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          HeightSpace1(space: 14),

          /// title
          GeneralText(padding:EdgeInsets.only(bottom: 10),text: 'Logout',sizeText:size.width * 0.05,fontWeight: FontWeight.w600,color: Colors.red,),
          Divider(thickness: size.width * 0.005,color: Colors.grey[300],),
          GeneralText(padding:EdgeInsets.symmetric(vertical: 12),text: 'Are you sure you want to logout ?',sizeText:size.width * 0.05,fontWeight: FontWeight.w600,),


          /// buttons
          Row(
            children: [
              Expanded(child: GeneralSecondButton(title: 'Cancel',bgColor:Colors.grey.shade200,titleColor: Colors.black,onTap: ()=> context.pop(),)),
              WidthSpace(space: 0.05),
              Expanded(
                child: GeneralSecondButton(
                  title: 'Yes Logout',
                  bgColor: Colors.black,
                  titleColor: Colors.white,
                  onTap: ()async{
                    await context.read<ProfileProvider>().logout(context);
                  },
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
