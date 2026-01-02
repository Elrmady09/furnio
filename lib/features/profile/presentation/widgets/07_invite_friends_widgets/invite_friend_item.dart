import 'package:flutter/material.dart';
import 'package:furnio/features/profile/logic/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';

class InviteFriendItem extends StatelessWidget {
  const InviteFriendItem({super.key, required this.name, required this.phone, required this.image});

  final String name;
  final String phone;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<ProfileProvider>();
    final isInvited = provider.isInvited(name);


    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: Row(
        children: [
          CircleAvatar(
            radius: size.width * 0.06,
            backgroundImage: AssetImage(image),
          ),
          WidthSpace(space: 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralText(
                  text: name,
                  sizeText: size.width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
                GeneralText(
                  text: phone,
                  sizeText: size.width * 0.04,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              provider.toggleInvite(name);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height * 0.005),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.05),
                color: isInvited ? Colors.white : Colors.black,
                border: isInvited ? Border.all(color: Colors.black,width: size.width * 0.004) : null,
              ),
              child: GeneralText(
                text: isInvited ? 'Invited' : 'Invite',
                color: isInvited ? Colors.black : Colors.white,
                sizeText: size.width * 0.037,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
