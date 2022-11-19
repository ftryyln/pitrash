import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/auth/register_model.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:final_project/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController {
  StorageCore storage = StorageCore();

  RegisterModel? registerModel = RegisterModel();
  final isObscured = false.obs;
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController phoneNumberController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController confirmPasswordController =
      TextEditingController(text: '');
  final TextEditingController addreessController =
      TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    nameController.text;
    phoneNumberController.text;
    emailController.text;
    passwordController.text;
    confirmPasswordController.text;
    addreessController.text;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.text;
    phoneNumberController.text;
    emailController.text;
    passwordController.text;
    confirmPasswordController.text;
    addreessController.text;
  }

  void doRegister(String name, String phoneNumber, String email,
      String password, String confirmPasword, String address) async {
    try {
      var response =
          await repository.postRegister(name, phoneNumber, email, password, address);
      registerModel = response;
      if (registerModel?.meta?.status == "Success") {
        Fluttertoast.showToast(msg: registerModel!.meta!.message!);
        update();
        Get.offAll(() => const LoginScreen());
      } else if (registerModel?.meta?.status == "Error") {
        Fluttertoast.showToast(msg: 'Data Tidak Lengkap');
      }
    } catch (e) {
      return null;
    }
  }
}
