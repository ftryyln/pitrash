import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/profile/account/change_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Kata Sandi Lama",
                                      style: body.copyWith(color: greyColor)),
                                  SizedBox(
                                    width: Get.width*0.51,
                                    height: 40,
                                    child: TextFormField(
                                        controller: controller.oldPasswordController,
                                        obscureText: controller.isObscured.isFalse,
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  controller.isObscured.toggle();
                                                },
                                                icon: Icon(
                                                  controller.isObscured.isTrue
                                                      ? Icons.visibility_off_rounded
                                                      : Icons.visibility_rounded,
                                                  color: Colors.grey,
                                                )))),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Kata Sandi Baru",
                                      style: body.copyWith(color: greyColor)),
                                  SizedBox(
                                    width: Get.width*0.51,
                                    height: 40,
                                    child: TextFormField(
                                        controller: controller.newPasswordController,
                                        obscureText: controller.isObscured.isFalse,
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  controller.isObscured.toggle();
                                                },
                                                icon: Icon(
                                                  controller.isObscured.isTrue
                                                      ? Icons.visibility_off_rounded
                                                      : Icons.visibility_rounded,
                                                  color: Colors.grey,
                                                )))),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Card(
                                elevation: 5,
                                color: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
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
