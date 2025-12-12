import 'package:flutter/material.dart';
import 'package:furnio/config/providers/app_providers.dart';
import 'package:provider/provider.dart';

import 'config/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Furnio());
}

class Furnio extends StatelessWidget {
  const Furnio({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp.router(
        title: 'Furniture Store',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
        themeMode: ThemeMode.system,
      ),
    );
  }
}



