import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/account_setup_provider.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AccountSetupProvider>();
    Size size = MediaQuery.of(context).size;

    return Center(
      child: GestureDetector(
        onTap: (){
          context.read<AccountSetupProvider>().pickProfileImage();

        },
        child: Stack(
          children: [
            CircleAvatar(
              radius: size.width * 0.15,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: provider.profileImage != null
                  ? FileImage(provider.profileImage!)
                  : null,
              child: provider.profileImage == null
                  ? const Icon(Icons.person,size: 60,)
                  : null ,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: size.width * 0.045,
                backgroundColor: Colors.black,
                child: const Icon(Icons.edit, color: Colors.white, size: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
