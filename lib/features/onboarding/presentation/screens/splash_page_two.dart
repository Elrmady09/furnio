import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/splash_widgets/splash_two_welcome.dart';



class SplashPageTwo extends StatefulWidget {
  const SplashPageTwo({super.key});

  @override
  State<SplashPageTwo> createState() => _SplashPageTwoState();
}

class _SplashPageTwoState extends State<SplashPageTwo> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      context.go('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            /// --- الصورة الخلفية ---
            SizedBox(
              width: size.width,
              height: size.height,
              child: Image.asset(
                "assets/image/splash/splash.jpg",   // ضع صورة splash هنا
                fit: BoxFit.cover,
              ),
            ),

            /// --- النصوص فوق الصورة ---
            Positioned(
              bottom: 0,
              child: SplashTwoWelcome(),
            ),

          ],
        ),
      ),
    );
  }
}
