import 'dart:io';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends BaseController {

  final prevName = Get.arguments[0];
  final prevEmail = Get.arguments[1];
  final prevPhone = Get.arguments[2];
  final prevAddress = Get.arguments[3];
  var prevPhoto = Get.arguments[4];
  String? token = StorageCore().getAccessToken();
  File? gettedFile;

  final isObscured = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addreessController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController.text = prevName;
    phoneNumberController.text = prevPhone;
    emailController.text = prevEmail;
    passwordController.text;
    confirmPasswordController.text;
    addreessController.text = prevAddress;
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

  getSinglePhoto() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      gettedFile = file;
      update();
    } else {
      // User canceled the picker
    }
  }

  // postUpdateProfile() async {
  //   var response = await repository.postUpdateProfile(Get.arguments,
  //       nameController.text, emailController.text, phoneNumberController.text, passwordController.text, addreessController.text, gettedFile, token!);
  //   Fluttertoast.showToast(msg: response!.meta!.message!);
  //   if (response.meta?.status == "success") {
  //     Get.offAll(() => const EditProfileScreen());
  //   }
  // }

}
