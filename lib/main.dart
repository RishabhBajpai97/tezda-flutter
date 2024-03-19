import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda/screens/landing.dart';
import 'package:tezda/screens/authentication/login_screen.dart';
import 'package:tezda/screens/authentication/signup_screen.dart';
import 'package:tezda/screens/product-details/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 683),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(secondary: const Color(0xff667eea)),
          ),
          home: const LoginScreen(),
          routes: {
            '/login': (context) => const LoginScreen(),
            "/signup": (context) => const SignupScreen(),
            "/home": (context) => const LandingScreen(),
            "/product_detail": (context) => const ProductDetailScreen(),
          },
        );
      },
    );
  }
}
