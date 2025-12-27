import 'package:furnio/features/onboarding/logic/onboarding_provider.dart';
import 'package:provider/provider.dart';
import '../../features/auth/logic/auth_provider.dart';
import '../../features/cart_and_checkout/logic/cart_provider.dart';
import '../../features/home/logic/home_provider.dart';



class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
  ];
}