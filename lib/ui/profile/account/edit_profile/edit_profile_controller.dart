import 'dart:io';
import 'package:dio/dio.dart';
import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends BaseController {

  final prevName = Get.arguments[0];
  final prevEmail = Get.arguments[1];
  final prevPhone = Get.arguments[2];
  final prevAddress = Get.arguments[3];
  var prevPhoto = Get.arguments[4];
  final userId = Get.arguments[5];
  String? token = StorageCore().getAccessToken();
  File? gettedFile;

  final isObscured = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addreessController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController.text = prevName;
    emailController.text = prevEmail;
    phoneNumberController.text = prevPhone;
    passwordController.text;
    addreessController.text = prevAddress;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addreessController.dispose();
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

  postUpdateProfile() async {
    try {
      var response = await repository.postEditProfile(userId.toString(),
          nameController.text, emailController.text, phoneNumberController.text, passwordController.text, addreessController.text, gettedFile, token!);
      Fluttertoast.showToast(msg: response!.meta!.message!);
      if (response.meta?.status?.toLowerCase() == "success") {
        // Get.offAll(() => const ProfileScreen());
        Get.back();
      }
    } on DioError catch(e) {
      Get.showSnackbar(GetSnackBar(message: "Terjadi Kesalahan ${e.response?.statusMessage}",));
    }
  }

}
