import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_text.dart';
import 'package:furnio/features/auth/logic/auth_mode.dart';
import 'package:furnio/features/auth/presentation/screens/auth_page.dart';
import 'package:furnio/features/home/presentation/screens/05_categories/reviews_page.dart';
import 'package:furnio/features/home/presentation/screens/main_layout.dart';
import 'package:furnio/features/pin/presentation/screens/pin_page.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/dialog/general_dialog.dart';
import '../../features/account_setup/presentation/screens/create_new_pin_page.dart';
import '../../features/account_setup/presentation/screens/fill_profile_page.dart';
import '../../features/account_setup/presentation/screens/fingerprint_page.dart';
import '../../features/auth/presentation/screens/lets_you_in_page.dart';
import '../../features/cart_and_checkout/presentation/screens/cart_page.dart';
import '../../features/cart_and_checkout/presentation/screens/checkout_page.dart';
import '../../features/cart_and_checkout/presentation/screens/choose_shipping_page.dart';
import '../../features/cart_and_checkout/presentation/screens/payment_methods_page.dart';
import '../../features/cart_and_checkout/presentation/screens/promo_code_page.dart';
import '../../features/cart_and_checkout/presentation/screens/shipping_address_page.dart';
import '../../features/forgot_password/presentation/screens/create_new_password_page.dart';
import '../../features/forgot_password/presentation/screens/forgot_password_page.dart';
import '../../features/forgot_password/presentation/screens/pin_code_page.dart';
import '../../features/home/presentation/screens/01_notifications/notifications_page.dart';
import '../../features/home/presentation/screens/02_favorites/favorite_page.dart';
import '../../features/home/presentation/screens/03_search_and_filter/search_and_filter_page.dart';
import '../../features/home/presentation/screens/04_special_offers/special_offers_page.dart';
import '../../features/home/presentation/screens/05_categories/categories_page.dart';
import '../../features/home/presentation/screens/05_categories/categories_product_detail_page.dart';
import '../../features/home/presentation/screens/home_page.dart';
import '../../features/onboarding/presentation/screens/onboarding_page.dart';
import '../../features/onboarding/presentation/screens/splash_page_one.dart';
import '../../features/onboarding/presentation/screens/splash_page_two.dart';


class AppRouter {
  static final router = GoRouter(
    initialLocation: '/cartAndCheckoutPin',
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashPageOne(),),
      GoRoute(path: '/splash2', builder: (_, __) => const SplashPageTwo(),),
      GoRoute(path: '/onboarding', builder: (_, __) => const OnBoardingPage(),),
      GoRoute(path: '/letsYouIn', builder: (_, __) => const LetsYouInPage(),),
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
      GoRoute(path: '/forgotPassword', builder: (context, state) => ForgotPasswordPage(email: state.extra as String,),),
      GoRoute(path: '/pinCode', builder: (_, __) => const PinCodePage(),),
      GoRoute(path: '/createNewPassword', builder: (_, __) => const CreateNewPasswordPage(),),
      GoRoute(path: '/fillProfile', builder: (_, __) => const FillProfilePage(),),
      GoRoute(path: '/NewPinPage', builder: (_, __) => const CreateNewPinPage(),),
      GoRoute(path: '/fingerprint', builder: (_, __) => const FingerprintPage(),),
      GoRoute(path: '/mainLayout', builder: (_, __) => const MainLayout(),),
      GoRoute(path: '/home', builder: (_, __) => const HomePage(),),
      GoRoute(path: '/01_notifications', builder: (_, __) => const NotificationsPage(),),
      GoRoute(path: '/favorite', builder: (_, __) => const FavoritePage(),),
      GoRoute(
        path: '/SearchAndFilter',
        builder: (context, state) {
          final query = state.extra as String;
          return SearchAndFilterPage(initialQuery: query,);

        }
      ),
      GoRoute(path: '/specialOffers', builder: (_, __) => const SpecialOffersPage(),),
      GoRoute(path: '/categories', builder: (context, state) => CategoriesPage(category:state.extra as String),),
      GoRoute(path: '/categoriesProductDetail', builder: (_, __) => const CategoriesProductDetailPage(),),
      GoRoute(path: '/reviews', builder: (_, __) => const ReviewsPage(),),
      GoRoute(path: '/cart', builder: (_, __) => const CartPage(),),
      GoRoute(path: '/checkout', builder: (_, __) => const CheckoutPage(),),
      GoRoute(path: '/shippingAddress', builder: (_, __) => const ShippingAddressPage(),),
      GoRoute(path: '/chooseShipping', builder: (_, __) => const ChooseShippingPage(),),
      GoRoute(path: '/promoCode', builder: (_, __) => const PromoCodePage(),),
      GoRoute(path: '/paymentMethods', builder: (_, __) => const PaymentMethodsPage(),),
      GoRoute(
        path: '/cartAndCheckoutPin',
        builder: (context, __) => PinPage(
            title: AppText.cartPinTitle,
            description: AppText.cartPinDescription,
            onComplete: (){
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => GeneralDialog(
                  showActions: true,
                  icon: Icons.shopping_cart_rounded,
                  title: 'Order Successful!',
                  description: 'You have successfully made order',

                ),
              );
            }
        ),
      ),



    ],
  );
}