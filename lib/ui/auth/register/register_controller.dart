import 'package:final_project/base/base_controller.dart';
import 'package:final_project/data/model/auth/register_model.dart';
import 'package:flutter/material.dart';

class RegisterController extends BaseController {
  RegisterModel? registerModel;

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
  final TextEditingController confirmPasswordController =
      TextEditingController();
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

  Future<RegisterModel?> doRegister({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String address,
  }) async {
    var response = await repository.postRegister(
        name, email, password, phoneNumber, address);
    registerModel = response;
    update();
    return response;
  }
}
