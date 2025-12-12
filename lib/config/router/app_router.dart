import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/sign_in_page.dart';
import '../../features/cart/presentation/screens/cart_page.dart';
import '../../features/home/presentation/screens/home_page.dart';
import '../../features/onboarding/presentation/screens/onboarding_page.dart';


class AppRouter {
  static final router = GoRouter(
    initialLocation: '/onboarding',
    routes: [
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
    ],
  );
}