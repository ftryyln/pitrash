import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/auth/login/login_controller.dart';
import 'package:final_project/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) => Scaffold(
              backgroundColor: whiteColor,
              body: RefreshIndicator(
                onRefresh: () async {
                  controller.emailController.clear();
                  controller.passwordController.clear();
                  controller.update();
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/vector/bgappbar.svg",
                          fit: BoxFit.cover),
                      Image.asset("assets/image/logotext.png"),
                      Form(
                        key: controller.formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40, left: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 25),
                              Text("Email",
                                  style: heading1.copyWith(
                                      color: blackColor, fontWeight: semiBold)),
                              SizedBox(
                                height: 50,
                                child: TextField(
                                  controller: controller.emailController,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      hintText: "pengguna@mail.com",
                                      hintStyle: heading1.copyWith(
                                          color: greyColor.withOpacity(0.6))),
                                ),
                              ),
                              const SizedBox(height: 25),
                              Text("Kata Sandi",
                                  style: heading1.copyWith(
                                      color: blackColor, fontWeight: semiBold)),
                              SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    controller: controller.passwordController,
                                    obscureText: controller.isObscured,
                                    decoration: InputDecoration(
                                        suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.isObscured =
                                            !controller.isObscured;
                                        controller.update();
                                      },
                                      child: Icon(
                                        controller.isObscured
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                      ),
                                    )),
                                  )),
                              const SizedBox(
                                height: 35,
                              ),
                              SizedBox(
                                  height: 50,
                                  width: Get.width,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (controller.formKey.currentState
                                                ?.validate() ==
                                            true) {
                                          controller.doLogin(
                                              controller.emailController.text,
                                              controller
                                                  .passwordController.text);
                                        }
                                      },
                                      child: Text("Masuk",
                                          style: heading.copyWith(
                                              fontWeight: bold)),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))))),
                              SizedBox(
                                height: 100,
                              ),
                              Divider(
                                  height: 1, color: greyColor, thickness: 1),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Belum memiliki akun?",
                                      style:
                                          heading1.copyWith(color: blackColor),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          Get.to(() => const RegisterScreen()),
                                      child: Text(
                                        "Daftar sekarang.",
                                        style: heading1.copyWith(
                                            color: primaryColor,
                                            fontWeight: extraBold),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
