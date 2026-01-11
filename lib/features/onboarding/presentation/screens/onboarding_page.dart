import 'package:flutter/material.dart';
import 'package:furnio/core/services/onboarding_service.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:go_router/go_router.dart';
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
            Expanded(
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
                      Container(
                        height: 470,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)
                          ),
                          image: DecorationImage(
                            image: AssetImage(pages[index]["image"]!,),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),


                      /// ============ النص ============
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
            HeightSpace1(space: 30),


            /// =====================
            ///        زر Next
            /// =====================

            GeneralButton(
              onTap: () async {
                if (onBoard.currentPage == 2) {
                  await OnBoardingService.setSeenOnBoarding();
                  if (!context.mounted) return;
                  context.go('/letsYouIn');
                } else {
                  onBoard.pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
              text: onBoard.currentPage == 2 ? "Get Started" : "Next",
            ),

            HeightSpace1(space: 20),
          ],
        ),
      ),
    );
  }
}
