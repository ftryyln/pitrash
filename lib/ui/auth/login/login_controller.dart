import 'package:final_project/data/storage_core.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final storage = StorageCore();
  //LoginModel loginModel = LoginModel();
  final isObscured = false.obs;
  final TextEditingController usernameController =
  TextEditingController(text: 'fit');
  final TextEditingController passwordController =
  TextEditingController(text: '12345678');
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    usernameController.text;
    passwordController.text;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void doLogin(String username, String password) async {
    try {
      // var response = await repository.postLogin(username, password);
      // loginModel = response;
      // if (loginModel.meta?.status == "success") {
      //   storage.saveAuthResponse(response);
      //   Fluttertoast.showToast(msg: response.meta!.message!);
      //   update();
      //   Get.offAll(() => const HomeScreen(), arguments: passwordController.text);
      // } else {
      //   Fluttertoast.showToast(msg: response.meta!.message!);
      // }
      Get.offAll(() => const HomeScreen(), arguments: passwordController.text);
    } catch (e) {
      return null;
    }
  }
}