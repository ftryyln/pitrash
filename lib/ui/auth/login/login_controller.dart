import 'package:dio/dio.dart';
import 'package:final_project/data/model/auth/login_model.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/ui/bottomappbar/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final storage = StorageCore();
  LoginModel loginModel = LoginModel();
  final TextEditingController emailController =
      TextEditingController(text: 'boing2@admin.com');
  final TextEditingController passwordController =
      TextEditingController(text: '12345678');
  final formKey = GlobalKey<FormState>();

  bool isObscured = false;

  @override
  void onInit() {
    super.onInit();
    emailController.text;
    passwordController.text;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void doLogin(String email, String password) async {
    try {
      var response = await repository.postLogin(email, password);
      loginModel = response;
      update();
      if (loginModel.meta?.status?.toLowerCase() == "success") {
        storage.saveAuthResponse(response);
        Fluttertoast.showToast(msg: response.meta!.message!);
        update();
        Get.offAll(() => const BottomNavBar(),
            arguments: passwordController.text);
      } else {
        Fluttertoast.showToast(msg: response.meta!.message!);
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: e.response.toString());
      return null;
    }
  }
}
