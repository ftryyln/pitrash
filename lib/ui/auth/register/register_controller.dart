import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/auth/register_model.dart';
import 'package:final_project/data/storage_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController {
  StorageCore storage = StorageCore();

  RegisterModel? registerModel = RegisterModel();

  bool isVisibleName = false;
  bool isVisiblePhone = false;
  bool isVisibleEmail = false;
  bool isVisiblePass = false;
  bool isVisibleConfirmPass = false;
  bool isVisibleAddress = false;
  bool isNotMatch = false;
  bool isObscuredPass = false;
  bool isObscuredConfirmPass = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addreessController = TextEditingController();
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

  // void doRegister(String name, String phoneNumber, String email,
  //     String password, String confirmPasword, String address) async {
  //   try {
  //     await repository
  //         .postRegister(name, phoneNumber, email, password, address)
  //         .then(
  //             (_) => Fluttertoast.showToast(msg: registerModel!.meta!.message!))
  //         .then((_) => Get.offAll(() => const LoginScreen()));
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: 'Data Tidak Lengkap');
  //     if (e == "Error") {
  //       Fluttertoast.showToast(msg: 'Data Tidak Lengkap');
  //     }
  //     return null;
  //   }
  // }
  Future doRegister({
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
    required String address,
  }) async {
    try {
      await repository
          .postRegister(
              name, phoneNumber, email, password, address)
          .then((_) => Get.showSnackbar(
                const GetSnackBar(
                  message: 'Pendaftaran Berhasil',
                  isDismissible: true,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.green,
                ),
              ))
          .then((_) => Get.back());
    } catch (e) {
      return e;
      // }
    }
  }
}
