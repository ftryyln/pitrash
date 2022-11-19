import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/auth/login/login_controller.dart';
import 'package:final_project/ui/auth/register/register_screen.dart';
import 'package:final_project/ui/home/home_screen.dart';
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SvgPicture.asset("assets/vector/bgappbar.svg",
                        fit: BoxFit.cover),
                    Image.asset("assets/image/logotext.png"),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40, left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            Text("Email",
                                style: heading1.copyWith(color: blackColor, fontWeight: semiBold)),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "user@gmail.com",
                                    hintStyle:
                                        heading1.copyWith(color: greyColor)),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text("Password",
                                style: heading1.copyWith(color: blackColor, fontWeight: semiBold)),
                            SizedBox(
                              height: 50,
                              child: TextFormField(
                                controller: controller.passwordController,
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
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            SizedBox(
                                height: 50,
                                width: 330,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Get.offAll(HomeScreen());
                                    },
                                    child: Text("Login",
                                        style:
                                            heading.copyWith(fontWeight: bold)),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))))),
                            SizedBox(
                              height: 100,
                            ),
                            Divider(height: 1, color: greyColor, thickness: 1),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: heading1.copyWith(color: blackColor),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.offAll(RegisterScreen());
                                    },
                                    child: Text(
                                      "Sign up.",
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
            ));
  }
}
