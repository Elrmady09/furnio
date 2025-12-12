import 'package:flutter/material.dart';

import '../../../../core/widgets/general_text.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: const Text("Theme Example")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Light / Dark Text Example"),
            GeneralText(text: '22',),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Button"),
            ),
          ],
        ),
      ),
    );
  }
}