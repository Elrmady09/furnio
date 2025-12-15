import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furnio/features/auth/logic/sign_up_provider.dart';
import 'package:provider/provider.dart';
import 'config/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/logic/auth_provider.dart';
import 'features/cart/logic/cart_provider.dart';
import 'features/home/logic/home_provider.dart';
import 'features/onboarding/logic/onboarding_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(
      MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
          ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ],
        child: const Furnio(),
      ),
  );
}

class Furnio extends StatelessWidget {
  const Furnio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Furniture Store',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
      themeMode: ThemeMode.system,
    );
  }
}



