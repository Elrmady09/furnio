import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/lets_you_in_page.dart';
import '../../features/auth/presentation/screens/sign_in_page.dart';
import '../../features/auth/presentation/screens/sign_up_page.dart';
import '../../features/cart/presentation/screens/cart_page.dart';
import '../../features/home/presentation/screens/home_page.dart';
import '../../features/onboarding/presentation/screens/onboarding_page.dart';
import '../../features/onboarding/presentation/screens/splash_page_one.dart';
import '../../features/onboarding/presentation/screens/splash_page_two.dart';


class AppRouter {
  static final router = GoRouter(
    initialLocation: '/letsYouIn',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (_, __) => const SplashPageOne(),
      ),
      GoRoute(
        path: '/splash2',
        builder: (_, __) => const SplashPageTwo(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (_, __) => const OnBoardingPage(),
      ),
      GoRoute(
        path: '/sign-in',
        builder: (_, __) => const SignInPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: '/cart',
        builder: (_, __) => const CartPage(),
      ),
      GoRoute(
        path: '/letsYouIn',
        builder: (_, __) => const LetsYouInPage(),
      ),
      GoRoute(
        path: '/signUp',
        builder: (_, __) => const SignUpPage(),
      ),
    ],
  );
}