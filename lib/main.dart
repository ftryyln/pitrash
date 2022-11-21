import 'package:final_project/const/color.dart';
import 'package:final_project/ui/auth/login/login_screen.dart';
import 'package:final_project/ui/bottomappbar/bottomnavbar.dart';
import 'package:final_project/ui/education/detail/education_detail_screen.dart';
import 'package:final_project/ui/education/education_screen.dart';
import 'package:final_project/ui/history/detail/history_detail_screen.dart';
import 'package:final_project/ui/history/history_screen.dart';
import 'package:final_project/ui/home/home_screen.dart';
import 'package:final_project/ui/notification/notification_screen.dart';
import 'package:final_project/ui/onboarding/onboarding_screen.dart';
import 'package:final_project/ui/payment/payment_screen.dart';
import 'package:final_project/ui/profile/aboutus/ourteam/ourteam_screen.dart';
import 'package:final_project/ui/profile/account/edit_profile/edit_profile_screen.dart';
import 'package:final_project/ui/profile/profile_screen.dart';
import 'package:final_project/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/global_bindings.dart';
import 'ui/auth/register/register_screen.dart';
import 'ui/profile/aboutus/pitrash/pitrash_screen.dart';

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
          backgroundColor: whiteColor,
          colorScheme: ThemeData().colorScheme.copyWith(primary: primaryColor),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: whiteColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 5, color: primaryColor),
            ),
          )),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/onboarding', page: () => const OnBoardingScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/bottomnavbar', page: () => const BottomNavBar()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/education', page: () => const EducationScreen()),
        GetPage(name: '/detaileducation', page: () => const EducationDetailScreen()),
        GetPage(name: '/history', page: () => const HistoryScreen()),
        GetPage(name: '/historydetail', page: () => const HistoryDetailScreen()),
        GetPage(name: '/notification', page: () => const NotificationScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/editprofile', page: () => const EditProfileScreen()),
        GetPage(name: '/ourteam', page: () => const OurTeamScreen()),
        GetPage(name: '/pitrash', page: () => const PiTrashScreen()),
        GetPage(name: '/payment', page: () => const PaymentScreen()),
      ],
      initialRoute: '/',
    );
  }
} // This trailing comma makes auto-formatting nicer for build methods.
