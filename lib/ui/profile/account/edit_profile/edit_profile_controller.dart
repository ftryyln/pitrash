import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends BaseController {
  StorageCore storage = StorageCore();

  //RegisterModel? registerModel = RegisterModel();
  final isObscured = false.obs;
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController phoneNumberController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController addreessController =
      TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
    nameController.text;
    phoneNumberController.text;
    emailController.text;
    addreessController.text;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.text;
    phoneNumberController.text;
    emailController.text;
    addreessController.text;
  }

  void doRegister(String name, String phoneNumber, String email,
      String password, String confirmPasword, String address) async {
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
