import 'dart:async';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/ui/bottomappbar/bottomnavbar.dart';
import 'package:final_project/ui/home/home_screen.dart';
import 'package:final_project/ui/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  //StorageCore storage = StorageCore();

  // @override
  // void onInit() {
  //   super.onInit();
  //   Timer(const Duration(seconds: 3), () {
  //     // if (storage.getAccessToken() != 'token_not_loaded') {
  //     //   Get.offAll(() => HomePage());
  //     // } else {
  //     //   Get.offAll(() => LoginPage());
  //     // }
  //     Get.offAll(() => OnBoarding());
  //   });
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(const Duration(seconds: 2), () {
      if (storage.getAccessToken() != 'token_not_loaded') {
        Get.offAll(() => const BottomNavBar());
      }else{
        Get.offAll(() => const OnBoardingScreen());
      }
    });
  }
}
