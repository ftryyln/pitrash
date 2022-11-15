import 'package:final_project/const/color.dart';
import 'package:final_project/ui/auth/login/login_screen.dart';
import 'package:final_project/ui/onboarding/onboarding_screen.dart';
import 'package:final_project/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/global_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PiTrash',
      theme: ThemeData(
        backgroundColor: white,
        colorScheme: ThemeData().colorScheme.copyWith(primary: primary),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 5,
              color: primary
            ),
          )
        )
      ),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/onboarding', page: () => const OnBoardingScreen()),
        GetPage(name: '/login', page: () => const LoginScreen())
      ],
      initialRoute: '/userDashboard',
    );
  }
} // This trailing comma makes auto-formatting nicer for build methods.
