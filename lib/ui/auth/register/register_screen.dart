import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/auth/login/login_screen.dart';
import 'package:final_project/ui/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            onTap: () {
              Get.offAll(LoginScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset("assets/vector/back.svg"),
            ),
          ),
        ),
        body: Form(
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
                      Text("Full Name",
                          style: heading.copyWith(
                              color: blackColor, fontWeight: semiBold)),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                            controller: controller.nameController,
                            decoration: InputDecoration(
                                hintText: "Full Name",
                                hintStyle:
                                    heading1.copyWith(color: greyColor))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Phone Number",
                          style: heading.copyWith(
                              color: blackColor, fontWeight: semiBold)),
                      // SizedBox(
                      //   height: 50,
                      //   child: TextFormField(
                      //       controller: controller.phoneNumberController,
                      //       decoration: InputDecoration(
                      //         prefixIcon: SizedBox(
                      //           width: 78,
                      //           child: Row(children: [
                      //             Padding(
                      //               padding: const EdgeInsets.only(
                      //                   left: 15, bottom: 9, top: 5),
                      //               child: Text(
                      //                 "+62",
                      //                 style:
                      //                     heading1.copyWith(color: greyColor),
                      //               ),
                      //             ),
                      //             SizedBox(width: 15),
                      //             Padding(
                      //               padding: const EdgeInsets.only(
                      //                   bottom: 5, top: 5, right: 15),
                      //               child: VerticalDivider(
                      //                 width: 5,
                      //                 color: greyColor,
                      //                 thickness: 1,
                      //               ),
                      //             )
                      //           ]),
                      //         ),
                      //         hintText: "81234567890",
                      //         hintStyle: heading1.copyWith(color: greyColor),
                      //       )),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Email",
                          style: heading.copyWith(
                              color: blackColor, fontWeight: semiBold)),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                            controller: controller.emailController),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Password",
                          style: heading.copyWith(
                              color: blackColor, fontWeight: semiBold)),
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
                                    )))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Confirm Password",
                          style: heading.copyWith(
                              color: blackColor, fontWeight: semiBold)),
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
                                    )))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Address",
                          style: heading.copyWith(
                              color: blackColor, fontWeight: semiBold)),
                      // SizedBox(
                      //   height: 100,
                      //   child: TextFormField(
                      //       controller: controller.addreessController,
                      //       maxLines: 5,
                      //       minLines: 4),
                      // ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                          height: 50,
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.doRegister(
                                  controller.nameController.text,
                                  controller.phoneNumberController.text,
                                  controller.emailController.text,
                                  controller.passwordController.text,
                                  controller.confirmPasswordController.text,
                                  controller.addreessController.text,
                                );
                              },
                              child: Text("Sign Up",
                                  style: heading.copyWith(fontWeight: bold)),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10))))),
                      SizedBox(
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
