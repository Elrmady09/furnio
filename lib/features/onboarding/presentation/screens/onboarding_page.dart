import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/onboarding_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final onBoard = Provider.of<OnBoardingProvider>(context);


    final List<Map<String, String>> pages = [
      {
        "image": "assets/image/onBording/onBordaing 1.jpg",
        "title": "We provide high quality products just for you",
      },
      {
        "image": "assets/image/onBording/onBordaing 2.jpg",
        "title": "Your satisfaction is our number one priority",
      },
      {
        "image": "assets/image/onBording/onBordaing 3.jpg",
        "title": "Let's fulfill your house needs with Funica right now!",
      },
    ];

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            /// =====================
            ///       PageView
            /// =====================
            SizedBox(
              height: size.height * 0.75,
              child: PageView.builder(
                controller: onBoard.pageController,
                itemCount: 3,
                onPageChanged: (index) {
                  onBoard.changePage(index);
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [

                      /// ============ الصورة (70%) ============
                      SizedBox(
                        height: size.height * 0.61,
                        width: size.width,
                        child: Image.asset(
                          pages[index]["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),

                      HeightSpace(space: 0.03),

                      /// ============ النص ============
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.10),
                        child: GeneralText(
                          text: pages[index]["title"]!,
                          sizeText: size.width * 0.06,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            HeightSpace(space: 0.03),

            /// =====================
            ///   Smooth Indicator
            /// =====================

            SmoothPageIndicator(
              controller: onBoard.pageController,
              count: 3,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: size.width * 0.08,
                  height: size.height * 0.014,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(size.width * 0.1),
                ),
                dotDecoration: DotDecoration(
                  width: size.height * 0.014,
                  height: size.height * 0.014,
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(size.width * 0.5),
                ),
              ),
            ),

            HeightSpace(space: 0.04),

            /// =====================
            ///        زر Next
            /// =====================

            GeneralButton(
              onTap: (){
                if (onBoard.currentPage == 2) {
                  // الصفحة الأخيرة → الانتقال النهائي
                  // ضع هنا الانتقال إلى صفحة Home أو Login
                } else {
                  onBoard.pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                }
              },
              text: onBoard.currentPage == 2 ? "Get Started" : "Next",
            ),

            HeightSpace(space: 0.05),
          ],
        ),
      ),
    );
  }
}
