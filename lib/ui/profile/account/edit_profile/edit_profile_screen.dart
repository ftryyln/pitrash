import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/profile/account/edit_profile/edit_profile_controller.dart';
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
              child: SizedBox(
                height: 996,
                child: Stack(children: [
                  SvgPicture.asset("assets/vector/bgappbar.svg",
                      fit: BoxFit.cover),
                  SizedBox(
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
                                  image: controller.prevPhoto != null
                                      ? NetworkImage(controller.prevPhoto)
                                          as ImageProvider<Object>
                                      : FileImage(controller.gettedFile!),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.getSinglePhoto();
                          },
                          child: Text("Ubah Foto Profil",
                              style: heading.copyWith(
                                  color: tertiaryColor, fontWeight: bold)),
                        ),
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
                              const SizedBox(
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
                                        controller:
                                            controller.phoneNumberController,
                                        decoration: const InputDecoration()),
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
                              const SizedBox(
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
                                        controller:
                                            controller.addreessController,
                                        maxLines: 5,
                                        minLines: 4),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // controller.postUpdateProfile();
                                },
                                child: Card(
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
                                              const Color(0xff4CAE31),
                                              const Color(0xff4BCC28).withOpacity(0.5)
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
                ]),
              ),
            ),
          );
        });
  }
}
