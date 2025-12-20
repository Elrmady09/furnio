import 'package:furnio/features/auth/logic/auth_mode.dart';
import 'package:furnio/features/auth/presentation/screens/auth_page.dart';
import 'package:furnio/features/home/presentation/screens/main_layout.dart';
import 'package:go_router/go_router.dart';
import '../../features/account_setup/presentation/screens/create_new_pin_page.dart';
import '../../features/account_setup/presentation/screens/fill_profile_page.dart';
import '../../features/account_setup/presentation/screens/fingerprint_page.dart';
import '../../features/auth/presentation/screens/lets_you_in_page.dart';
import '../../features/cart/presentation/screens/cart_page.dart';
import '../../features/forgot_password/presentation/screens/create_new_password_page.dart';
import '../../features/forgot_password/presentation/screens/forgot_password_page.dart';
import '../../features/forgot_password/presentation/screens/pin_code_page.dart';
import '../../features/home/presentation/screens/home_page.dart';
import '../../features/home/presentation/screens/notifications/notifications_page.dart';
import '../../features/onboarding/presentation/screens/onboarding_page.dart';
import '../../features/onboarding/presentation/screens/splash_page_one.dart';
import '../../features/onboarding/presentation/screens/splash_page_two.dart';


class AppRouter {
  static final router = GoRouter(
    initialLocation: '/mainLayout',
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
        path: '/letsYouIn',
        builder: (_, __) => const LetsYouInPage(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) {
          final mode = state.uri.queryParameters['mode'];

          return AuthPage(
            mode: mode == 'signIn'
                ? AuthMode.signIn
                : AuthMode.signUp,
          );
        },
      ),
      GoRoute(
        path: '/forgotPassword',
        builder: (context, state) => ForgotPasswordPage(email: state.extra as String,),
      ),
      GoRoute(
        path: '/pinCode',
        builder: (_, __) => const PinCodePage(),
      ),
      GoRoute(
        path: '/createNewPassword',
        builder: (_, __) => const CreateNewPasswordPage(),
      ),
      GoRoute(
        path: '/fillProfile',
        builder: (_, __) => const FillProfilePage(),
      ),
      GoRoute(
        path: '/NewPinPage',
        builder: (_, __) => const CreateNewPinPage(),
      ),
      GoRoute(
        path: '/fingerprint',
        builder: (_, __) => const FingerprintPage(),
      ),
      GoRoute(
        path: '/mainLayout',
        builder: (_, __) => const MainLayout(),
      ),
      GoRoute(
        path: '/home',
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: '/notifications',
          builder: (_, __) => const NotificationsPage(),
      ),
      GoRoute(
        path: '/cart',
        builder: (_, __) => const CartPage(),
      ),


    ],
  );
}