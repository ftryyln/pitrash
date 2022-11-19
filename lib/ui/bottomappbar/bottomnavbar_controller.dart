import 'package:final_project/base/base_controller.dart';
import 'package:final_project/ui/history/history_screen.dart';
import 'package:final_project/ui/home/home_screen.dart';
import 'package:final_project/ui/profile/profile_screen.dart';
import 'package:get/get.dart';

class BottomNavBarController extends BaseController {
  final indexHalaman = 0.obs;

  List screen = [
    const HomeScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];
}