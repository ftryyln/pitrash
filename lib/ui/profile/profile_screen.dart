import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/auth/login/login_screen.dart';
import 'package:final_project/ui/profile/aboutus/ourteam/ourteam_screen.dart';
import 'package:final_project/ui/profile/aboutus/pitrash/pitrash_screen.dart';
import 'package:final_project/ui/profile/account/change_password/change_password_screen.dart';
import 'package:final_project/ui/profile/account/edit_profile/edit_profile_screen.dart';
import 'package:final_project/ui/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.state == ProfileViewState.loading) {
            return Scaffold(
              body: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Lottie.asset("assets/lottie/loading.json"))),
            );
          }
          return Scaffold(
            backgroundColor: whiteColor,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/vector/bgappbarprofile.svg",
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, bottom: 0, left: 170, right: 170),
                        child: Text("Profil", style: title),
                      )
                    ],
                  ),
                  SizedBox(
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
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      NetworkImage(controller.imageProfile))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(controller.profileModel?.data?.name?.capitalize ?? "-",
                            style: heading.copyWith(
                                color: primaryColor, fontWeight: bold)),
                        Text(controller.profileModel?.data?.email ?? "-",
                            style: heading1.copyWith(
                                color: tertiaryColor, fontWeight: regular)),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Akun",
                            style: heading1.copyWith(color: greyColor)),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () => {
                            Get.to(() => const EditProfileScreen(), arguments: [
                              controller.profileModel?.data?.name,
                              controller.profileModel?.data?.email,
                              controller.profileModel?.data?.phone,
                              controller.profileModel?.data?.userDetail?.address,
                              controller.profileModel?.data?.userDetail?.image,
                              controller.profileModel?.data?.userDetail?.id
                            ])
                          },
                          child: SizedBox(
                            width: Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text("Ubah Profil",
                                      style:
                                          heading1.copyWith(color: blackColor)),
                                ),
                                const Icon(Icons.arrow_forward_ios_rounded,
                                    color: primaryColor, size: 14),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Divider(
                            height: 1,
                            color: greyColor.withOpacity(0.5),
                            thickness: 1),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => const ChangePasswordScreen()),
                          child: SizedBox(
                            width: Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text("Ubah Kata Sandi",
                                      style:
                                          heading1.copyWith(color: blackColor)),
                                ),
                                const Icon(Icons.arrow_forward_ios_rounded,
                                    color: primaryColor, size: 14),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Divider(
                            height: 1,
                            color: greyColor.withOpacity(0.5),
                            thickness: 1),
                        const SizedBox(
                          height: 35,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tentang Kami",
                                style: heading1.copyWith(color: greyColor)),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  {Get.to(() => const OurTeamScreen())},
                              child: SizedBox(
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tim Kami",
                                        style: heading1.copyWith(
                                            color: blackColor)),
                                    const Icon(Icons.arrow_forward_ios_rounded,
                                        color: primaryColor, size: 14),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Divider(
                                height: 1,
                                color: greyColor.withOpacity(0.5),
                                thickness: 1),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  {Get.to(() => const PiTrashScreen())},
                              child: SizedBox(
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("PiTrash",
                                        style: heading1.copyWith(
                                            color: blackColor)),
                                    const Icon(Icons.arrow_forward_ios_rounded,
                                        color: primaryColor, size: 14),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Divider(
                                height: 1,
                                color: greyColor.withOpacity(0.5),
                                thickness: 1),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.storage.deleteAuthResponse();
                            Get.offAll(() => const LoginScreen());
                            controller.logout(
                                controller.storage.getCurrentUserId()!,
                                Get.arguments);
                          },
                          child: Card(
                            elevation: 5,
                            color: redColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              width: Get.width,
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
