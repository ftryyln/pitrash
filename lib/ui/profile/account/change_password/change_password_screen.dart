import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/profile/account/change_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
        init: ChangePasswordController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              backgroundColor: primaryColor,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset("assets/vector/back.svg",
                      color: whiteColor),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  SvgPicture.asset("assets/vector/bgappbar.svg",
                      fit: BoxFit.cover),
                  SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/vector/changepass.svg",
                            width: 300, height: 300),
                        Text("Ubah Kata Sandi",
                            style: title.copyWith(color: primaryColor)),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kata Sandi Baru",
                                  style: heading1.copyWith(
                                      color: blackColor, fontWeight: semiBold)),
                              TextFormField(
                                obscureText: controller.isObscuredPass,
                                decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.isObscuredPass =
                                        !controller.isObscuredPass;
                                        controller.update();
                                      },
                                      child: Icon(
                                        controller.isObscuredPass
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                      ),
                                    )),
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    controller.isVisiblePass = true;
                                  } else {
                                    controller.isVisiblePass = false;
                                  }
                                  controller.update();
                                },
                                controller: controller.newPasswordController,
                              ),
                              Visibility(
                                  visible: controller.isVisiblePass,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.error_rounded,
                                            color: redColor),
                                        const SizedBox(width: 10),
                                        Text("Kata Sandi Baru Harus Diisi",
                                            style:
                                            tiny.copyWith(color: redColor))
                                      ],
                                    ),
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              Text("Konfirmasi Kata Sandi",
                                  style: heading1.copyWith(
                                      color: blackColor, fontWeight: semiBold)),
                              TextFormField(
                                obscureText: controller.isObscuredConfirmPass,
                                decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.isObscuredConfirmPass =
                                        !controller.isObscuredConfirmPass;
                                        controller.update();
                                      },
                                      child: Icon(
                                        controller.isObscuredConfirmPass
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                      ),
                                    )),
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    controller.isVisibleConfirmPass = true;
                                    controller.isNotMatch = false;
                                  } else if (value !=
                                      controller
                                          .confirmPasswordController.text) {
                                    controller.isVisibleConfirmPass = false;
                                    controller.isNotMatch = true;
                                  } else {
                                    controller.isVisibleConfirmPass = false;
                                    controller.isNotMatch = false;
                                  }
                                  controller.update();
                                },
                                controller:
                                controller.confirmPasswordController,
                              ),
                              Visibility(
                                  visible: controller.isVisibleConfirmPass,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.error_rounded,
                                            color: redColor),
                                        const SizedBox(width: 10),
                                        Text("Konfirmasi Password Harus Diisi",
                                            style:
                                            tiny.copyWith(color: redColor))
                                      ],
                                    ),
                                  )),
                              Visibility(
                                  visible: controller.isNotMatch,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.error_rounded,
                                            color: redColor),
                                        const SizedBox(width: 10),
                                        Text("Kata Sandi Harus Sama",
                                            style:
                                            tiny.copyWith(color: redColor))
                                      ],
                                    ),
                                  )),
                              const SizedBox(
                                height: 35,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (controller
                                      .newPasswordController.text.isEmpty ||
                                      controller.confirmPasswordController.text
                                          .isEmpty) {
                                    if (controller
                                        .newPasswordController.text.isEmpty) {
                                      controller.isVisiblePass = true;
                                    }
                                    if (controller.confirmPasswordController
                                        .text.isEmpty) {
                                      controller.isVisibleConfirmPass = true;
                                    }
                                  } else {
                                    controller.postChangePassword(
                                      password: controller.newPasswordController.text,
                                    )
                                        .then((value) {
                                      if (value?.meta?.code == 201) {
                                        Fluttertoast.showToast(
                                            msg: value?.meta?.code == 201
                                                ? 'Pendaftaran Berhasil'
                                                : "Pendaftaran Gagal");
                                        Get.back();
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: value?.meta?.code == 201
                                                ? 'Pendaftaran Berhasil'
                                                : "Pendaftaran Gagal");
                                      }
                                    });
                                  }
                                  controller.update();
                                },
                                child: Card(
                                  elevation: 5,
                                  color: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        gradient: LinearGradient(
                                            colors: [
                                              primaryColor,
                                              darkColor.withOpacity(0.5)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter),
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                          "Ubah",
                                          style:
                                          body.copyWith(fontWeight: semiBold),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
