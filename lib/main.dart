import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furnio/features/auth/logic/sign_up_provider.dart';
import 'package:furnio/features/home/logic/filter_provider.dart';
import 'package:furnio/features/orders/logic/orders_provider.dart';
import 'package:provider/provider.dart';
import 'config/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/account_setup/logic/account_setup_provider.dart';
import 'features/account_setup/logic/fingerprint_provider.dart';
import 'features/auth/logic/auth_provider.dart';
import 'features/cart_and_checkout/logic/cart_provider.dart';
import 'features/cart_and_checkout/logic/checkout_provider.dart';
import 'features/forgot_password/logic/forgot_password_provider.dart';
import 'features/forgot_password/logic/new_password_provider.dart';
import 'features/forgot_password/logic/pin_code_provider.dart';
import 'features/home/logic/categories_product_detail_provider.dart';
import 'features/home/logic/home_provider.dart';
import 'features/home/logic/search_provider.dart';
import 'features/onboarding/logic/onboarding_provider.dart';
import 'features/orders/logic/track_order_provider.dart';
import 'features/pin/logic/pin_provider.dart';
import 'features/profile/logic/add_new_card_provider.dart';
import 'features/profile/logic/chat_provider.dart';
import 'features/profile/logic/profile_provider.dart';
import 'features/wallet/logic/wallet_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
          ChangeNotifierProvider(create: (_) => SignUpProvider()),
          ChangeNotifierProvider(create: (_) => AccountSetupProvider()),
          ChangeNotifierProvider(create: (_) => FingerprintProvider()),
          ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
          ChangeNotifierProvider(create: (_) => NewPasswordProvider()),
          ChangeNotifierProvider(create: (_) => PinCodeProvider ()),
          ChangeNotifierProvider(create: (_) => SearchProvider ()),
          ChangeNotifierProvider(create: (_) => SortAndFilterProvider ()),
          ChangeNotifierProvider(create: (_) => CategoriesProductDetailProvider()),
          ChangeNotifierProvider(create: (_) => CheckoutProvider()),
          ChangeNotifierProvider(create: (_) => PinProvider()),
          ChangeNotifierProvider(create: (_) => OrdersProvider()),
          ChangeNotifierProvider(create: (_) => TrackOrderProvider()),
          ChangeNotifierProvider(create: (_) => WalletProvider()),
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
          ChangeNotifierProvider(create: (_) => AddNewCardProvider()),
          ChangeNotifierProvider(create: (_) => ChatProvider()),

        ],
        child: const Furnio(),
      ),
  );
}

class Furnio extends StatelessWidget {
  const Furnio({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    return MaterialApp.router(
      title: 'Furniture Store',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.themeMode,
      routerConfig: AppRouter.router,

    );
  }
}



