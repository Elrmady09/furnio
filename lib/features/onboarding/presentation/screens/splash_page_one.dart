import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';


class SplashPageOne extends StatefulWidget {
  const SplashPageOne({super.key});

  @override
  State<SplashPageOne> createState() => _SplashPageOneState();
}

class _SplashPageOneState extends State<SplashPageOne> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      context.go('/splash2');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            /// --- منتصف الشاشة ---
            Expanded(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/image/splash/furnio icon.png',scale: size.width * 0.05,),
                    WidthSpace(space: 0.03),

                    GeneralText(
                      text: "Furnio",  // غير النص كما تريد
                      sizeText: size.width * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),

            /// --- أسفل الشاشة : دائرة تحميل ---
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.05),
              child: SizedBox(
                width: size.width * 0.12,
                height: size.width * 0.12,
                child: CircularProgressIndicator(
                  color: Colors.black,
                    backgroundColor: Colors.grey,
                    strokeWidth: 5
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
