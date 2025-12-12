import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../features/auth/logic/auth_provider.dart';
import '../../features/home/logic/home_provider.dart';
import '../../features/cart/logic/cart_provider.dart';


class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ];
}