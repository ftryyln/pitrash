import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/profile/account/edit_profile/edit_profile_controller.dart';
import 'package:final_project/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: whiteColor,
            appBar:
                AppBar(backgroundColor: primaryColor, elevation: 0, actions: [
              GestureDetector(
                onTap: () {
                  Get.offAll(ProfileScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset("assets/vector/icon_close.svg",
                      color: whiteColor),
                ),
              ),
            ]),
            body: SingleChildScrollView(
              child: SizedBox(
                height: 996,
                child: Stack(children: [
                  SvgPicture.asset("assets/vector/bgappbar.svg",
                      fit: BoxFit.cover),
                  Container(
                    width: Get.width,
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: tertiaryColor, width: 3),
                              color: primaryColor,
                              image: DecorationImage(
                                  image: AssetImage("assets/image/image.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Ubah Foto Profil",
                            style: heading.copyWith(
                                color: tertiaryColor, fontWeight: bold)),
                        SizedBox(
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
                                  Text("Nama Lengkap",
                                      style: body.copyWith(
                                          color: greyColor,
                                          fontWeight: medium)),
                                  SizedBox(
                                    width: 230,
                                    height: 40,
                                    child: TextFormField(
                                      controller: controller.nameController,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Nomor Ponsel",
                                      style: body.copyWith(
                                          color: greyColor,
                                          fontWeight: medium)),
                                  SizedBox(
                                    width: 230,
                                    height: 50,
                                    child: TextFormField(
                                        controller: controller.phoneNumberController,
                                        decoration: InputDecoration(
                                          prefixIcon: SizedBox(
                                            width: 78,
                                            child: Row(children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, bottom: 9, top: 5),
                                                child: Text(
                                                  "+62",
                                                  style:
                                                  heading1.copyWith(color: greyColor.withOpacity(0.6)),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5, top: 5, right: 15),
                                                child: VerticalDivider(
                                                  width: 5,
                                                  color: greyColor,
                                                  thickness: 1,
                                                ),
                                              )
                                            ]),
                                          ),
                                          hintText: "81234567890",
                                          hintStyle: heading1.copyWith(color: greyColor.withOpacity(0.6)),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Email",
                                      style: body.copyWith(
                                          color: greyColor,
                                          fontWeight: medium)),
                                  SizedBox(
                                    width: 230,
                                    height: 40,
                                    child: TextFormField(
                                      controller: controller.emailController,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Alamat Lengkap",
                                      style: body.copyWith(
                                          color: greyColor,
                                          fontWeight: medium)),
                                  SizedBox(
                                    width: 230,
                                    height: 100,
                                    child: TextFormField(
                                        controller: controller.addreessController,
                                        maxLines: 5,
                                        minLines: 4),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Card(
                                elevation: 5,
                                color: darkColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xff4CAE31),
                                            Color(0xff4BCC28).withOpacity(0.5)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    "Ubah",
                                    style: body.copyWith(fontWeight: semiBold),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
