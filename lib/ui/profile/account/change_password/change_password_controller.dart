import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends BaseController {
  StorageCore storage = StorageCore();

  //RegisterModel? registerModel = RegisterModel();
  final isObscured = false.obs;
  final TextEditingController oldPasswordController = TextEditingController(text: '');
  final TextEditingController newPasswordController = TextEditingController(text: '');
  final TextEditingController confirmPasswordController = TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
    oldPasswordController.text;
    newPasswordController.text;
    confirmPasswordController.text;
  }

  @override
  void dispose() {
    super.dispose();
    oldPasswordController.text;
    newPasswordController.text;
    confirmPasswordController.text;
  }

  void doRegister(
      String oldPassword, String password, String confirmPasword) async {
    // try {
    //   // isLoading.isTrue;
    //   var response =
    //   await repository.postRegister(name, email, username, password);
    //   registerModel = response;
    //   if (registerModel?.meta?.status == "success") {
    //     Fluttertoast.showToast(msg: registerModel!.meta!.message!);
    //     update();
    //     Get.offAll(() => const LoginPage());
    //   } else if (registerModel?.meta?.status == "error") {
    //     Fluttertoast.showToast(msg: 'data tidak lengkap');
    //   }
    // } catch (e) {
    return null;
    //}
  }
}
