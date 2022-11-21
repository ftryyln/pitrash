import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/profile/profile_model.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:final_project/ui/auth/login/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum ProfileViewState {
  none,
  loading,
  error,
}

class ProfileController extends BaseController {
  ProfileViewState _state = ProfileViewState.none;

  ProfileViewState get state => _state;
  String? token = StorageCore().getAccessToken();
  String imageProfile = "";
  ProfileModel? profileModel;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  changeState(ProfileViewState s) {
    _state = s;
    update();
  }

  fetchProfile() async {
    changeState(ProfileViewState.loading);
    try {
      var response = await repository.getProfile();
      profileModel = response;
      imageProfile = response.data?.userDetail?.image ?? "https://";
      update();
      changeState(ProfileViewState.none);
    } on DioError catch (e) {
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
