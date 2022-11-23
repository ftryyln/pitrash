import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) => Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset("assets/vector/back.svg"),
            ),
          ),
        ),
        body: Form(
          key: controller.formKey,
          child: Column(children: [
            SizedBox(
                height: 250,
                width: 250,
                child: SvgPicture.asset("assets/vector/register.svg")),
            const SizedBox(height: 25),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama Lengkap",
                              style: heading1.copyWith(
                                  color: blackColor, fontWeight: semiBold)),
                          TextFormField(
                            onChanged: (value) {
                              if (value.isEmpty) {
                                controller.isVisibleName = true;
                              } else {
                                controller.isVisibleName = false;
                              }
                              controller.update();
                            },
                            controller: controller.nameController,
                          ),
                          Visibility(
                              visible: controller.isVisibleName,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    const Icon(Icons.error_rounded,
                                        color: redColor),
                                    const SizedBox(width: 10),
                                    Text("Nama Lengkap Harus Diisi",
                                        style: tiny.copyWith(color: redColor))
                                  ],
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Nomor Ponsel",
                          style: heading1.copyWith(
                              color: blackColor, fontWeight: semiBold)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            controller.isVisiblePhone = true;
                          } else {
                            controller.isVisiblePhone = false;
                          }
                          controller.update();
                        },
                        controller: controller.phoneNumberController,
                      ),
                      Visibility(
                          visible: controller.isVisiblePhone,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                const Icon(Icons.error_rounded, color: redColor),
                                const SizedBox(width: 10),
                                Text("Nomor Ponsel Harus Diisi",
                                    style: tiny.copyWith(color: redColor))
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Email",
                          style: heading1.copyWith(
                              color: blackColor, fontWeight: semiBold)),
                      TextFormField(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            controller.isVisibleEmail = true;
                          } else {
                            controller.isVisibleEmail = false;
                          }
                          controller.update();
                        },
                        controller: controller.emailController,
                      ),
                      Visibility(
                          visible: controller.isVisibleEmail,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                const Icon(Icons.error_rounded, color: redColor),
                                const SizedBox(width: 10),
                                Text("Email Harus Diisi",
                                    style: tiny.copyWith(color: redColor))
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Kata Sandi",
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
                        controller: controller.passwordController,
                      ),
                      Visibility(
                          visible: controller.isVisiblePass,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                const Icon(Icons.error_rounded, color: redColor),
                                const SizedBox(width: 10),
                                Text("Kata Sandi Harus Diisi",
                                    style: tiny.copyWith(color: redColor))
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
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
                              controller.passwordController.text) {
                            controller.isVisibleConfirmPass = false;
                            controller.isNotMatch = true;
                          } else {
                            controller.isVisibleConfirmPass = false;
                            controller.isNotMatch = false;
                          }
                          controller.update();
                        },
                        controller: controller.confirmPasswordController,
                      ),
                      Visibility(
                          visible: controller.isVisibleConfirmPass,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                const Icon(Icons.error_rounded, color: redColor),
                                const SizedBox(width: 10),
                                Text("Konfirmasi Password Harus Diisi",
                                    style: tiny.copyWith(color: redColor))
                              ],
                            ),
                          )),
                      Visibility(
                          visible: controller.isNotMatch,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                const Icon(Icons.error_rounded, color: redColor),
                                const SizedBox(width: 10),
                                Text("Kata Sandi Harus Sama",
                                    style: tiny.copyWith(color: redColor))
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Address",
                          style: heading1.copyWith(
                              color: blackColor, fontWeight: semiBold)),
                      TextFormField(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            controller.isVisibleAddress = true;
                          } else {
                            controller.isVisibleAddress = false;
                          }
                          controller.update();
                        },
                        controller: controller.addreessController,
                        maxLines: 5,
                      ),
                      Visibility(
                          visible: controller.isVisibleAddress,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                const Icon(Icons.error_rounded, color: redColor),
                                const SizedBox(width: 10),
                                Text("Alamat Harus Diisi",
                                    style: tiny.copyWith(color: redColor))
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                          height: 50,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () async {
                                // final form = controller.formKey.currentState;
                                // if (form!.validate()) {
                                //   controller.doRegister(
                                //     controller.nameController.text,
                                //     controller.phoneNumberController.text,
                                //     controller.emailController.text,
                                //     controller.passwordController.text,
                                //     controller.confirmPasswordController.text,
                                //     controller.addreessController.text,
                                //   );
                                // }
                                // if (controller.nameController.text.isEmpty) {
                                //   controller.isVisibleAddress = true;
                                // }
                                // controller.update();

                                if (controller.nameController.text.isEmpty ||
                                    controller
                                        .phoneNumberController.text.isEmpty ||
                                    controller.emailController.text.isEmpty ||
                                    controller
                                        .passwordController.text.isEmpty ||
                                    controller.confirmPasswordController.text
                                        .isEmpty ||
                                    controller
                                        .addreessController.text.isEmpty) {
                                  if (controller.nameController.text.isEmpty) {
                                    controller.isVisibleName = true;
                                  }
                                  if (controller
                                      .phoneNumberController.text.isEmpty) {
                                    controller.isVisiblePhone = true;
                                  }
                                  if (controller.emailController.text.isEmpty) {
                                    controller.isVisibleEmail = true;
                                  }
                                  if (controller
                                      .passwordController.text.isEmpty) {
                                    controller.isVisiblePass = true;
                                  }
                                  if (controller
                                      .confirmPasswordController.text.isEmpty) {
                                    controller.isVisibleConfirmPass = true;
                                  }
                                  if (controller
                                      .addreessController.text.isEmpty) {
                                    controller.isVisibleAddress = true;
                                  }
                                } else {
                                  controller
                                      .doRegister(
                                    name: controller.nameController.text,
                                    phoneNumber:
                                        controller.phoneNumberController.text,
                                    email: controller.emailController.text,
                                    password:
                                        controller.passwordController.text,
                                    address: controller.addreessController.text,
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
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10))),
                              child: Text("Daftar",
                                  style: heading.copyWith(fontWeight: bold)))),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
