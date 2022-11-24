import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../data/model/profile/change_password_model.dart';
import '../../../../data/storage_core.dart';

class ChangePasswordController extends BaseController {
  String? token = StorageCore().getAccessToken();

  bool isVisiblePass = false;
  bool isVisibleConfirmPass = false;
  bool isNotMatch = false;
  bool isObscuredPass = false;
  bool isObscuredConfirmPass = false;

  final TextEditingController newPasswordController =
  TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  void onInit() {
    super.onInit();
    newPasswordController.text;
    confirmPasswordController.text;
  }

  @override
  void dispose() {
    super.dispose();
    newPasswordController.text;
    confirmPasswordController.text;
  }

  Future<ChangePasswordModel?> postChangePassword({required String password}) async {
    try {
      var response = await repository.postChangePassword(
          newPasswordController.text, token!);
      Fluttertoast.showToast(msg: response.meta!.message!);
      if (response.meta?.status?.toLowerCase() == "success") {
        // Get.offAll(() => const ProfileScreen());
        Get.back();
      }
    } on DioError catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: "Terjadi Kesalahan ${e.response?.statusMessage}",));
    }
    return null;
  }
}
