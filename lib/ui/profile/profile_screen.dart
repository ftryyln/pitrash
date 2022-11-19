import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/profile/aboutus/ourteam/ourteam_screen.dart';
import 'package:final_project/ui/profile/aboutus/pitrash/pitrash_screen.dart';
import 'package:final_project/ui/profile/account/change_password/change_password_screen.dart';
import 'package:final_project/ui/profile/account/edit_profile/edit_profile_screen.dart';
import 'package:final_project/ui/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: whiteColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  //alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/vector/bgappbarprofile.svg",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40, bottom: 0, left: 172, right: 172),
                      child: Text("Profil", style: title),
                    )
                  ],
                ),
                Container(
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primaryColor, width: 3),
                            color: primaryColor,
                            image: DecorationImage(
                                image: AssetImage("assets/image/image.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Nama User",
                          style: heading.copyWith(
                              color: primaryColor, fontWeight: bold)),
                      Text("user@gmail.com",
                          style: heading1.copyWith(
                              color: tertiaryColor, fontWeight: regular)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Akun", style: heading1.copyWith(color: greyColor)),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => {
                          Get.offAll(EditProfileScreen())
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Ubah Profil",
                                  style: heading1.copyWith(color: blackColor)),
                              Icon(Icons.arrow_forward_ios_rounded,
                                  color: primaryColor, size: 14),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(height: 1, color: greyColor.withOpacity(0.5), thickness: 1),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () => {
                          Get.offAll(ChangePasswordScreen())
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Ubah Kata Sandi",
                                  style: heading1.copyWith(color: blackColor)),
                              Icon(Icons.arrow_forward_ios_rounded,
                                  color: primaryColor, size: 14),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(height: 1, color: greyColor.withOpacity(0.5), thickness: 1),
                      SizedBox(
                        height: 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tentang Kami",
                              style: heading1.copyWith(color: greyColor)),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () => {
                              Get.offAll(OurTeamScreen())
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Tim Kami",
                                      style: heading1.copyWith(color: blackColor)),
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      color: primaryColor, size: 14),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(height: 1, color: greyColor.withOpacity(0.5), thickness: 1),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () => {
                              Get.offAll(PiTrashScreen())
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("PiTrash",
                                      style: heading1.copyWith(color: blackColor)),
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      color: primaryColor, size: 14),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(height: 1, color: greyColor.withOpacity(0.5), thickness: 1),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Card(
                        elevation: 5,
                        color: redColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                              color: redColor,
                              gradient: LinearGradient(
                                  colors: [
                                    redColor,
                                    red2Color.withOpacity(0.5)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            "Keluar",
                            style: body.copyWith(fontWeight: semiBold),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
