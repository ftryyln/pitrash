import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/profile/profile_model.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:final_project/ui/auth/login/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  String? token = StorageCore().getAccessToken();

  ProfileModel? profileModel;

  @override
  void onInit() {
    fetchProfile();
    // update();
    super.onInit();
  }

  fetchProfile() async {
    try {
      var response = await repository.getProfile();
      profileModel = response;
      update();
    } on DioError catch(e) {
      print(e.response?.data.toString());
    }

  }

  void logout(String username, String password) async {
    try {
      var response = await repository.postLogout(username, password);
      if (response.meta?.status == 'success') {
        storage.deleteAuthResponse();
        Fluttertoast.showToast(msg: response.meta!.message!);
        Get.offAll(() => const LoginScreen());
      } else {
        Fluttertoast.showToast(msg: response.meta!.message!);
      }
    } catch (e) {
      return null;
    }
  }
}
