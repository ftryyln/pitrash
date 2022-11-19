import 'package:final_project/const/color.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/profile/aboutus/ourteam/ourteam_controller.dart';
import 'package:final_project/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OurTeamScreen extends StatelessWidget {
  const OurTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OurTeamController>(
        init: OurTeamController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: primaryColor,
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
                child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    Text("Best Team",
                        style: GoogleFonts.bungeeShade(
                            color: whiteColor, fontSize: 42)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(70)),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: primaryColor, width: 3),
                                color: primaryColor,
                                image: DecorationImage(
                                    image: AssetImage("assets/image/image.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Fitry Yuliani",
                                  style: title.copyWith(color: primaryColor)),
                              Text("Mobile Developer",
                                  style: heading.copyWith(color: greyColor))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(70)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Andrian Dwi",
                                    style: title.copyWith(color: primaryColor)),
                                Text(
                                  "Front-End Web Developer",
                                  style: heading.copyWith(color: greyColor),
                                  textAlign: TextAlign.end,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: primaryColor, width: 3),
                                color: primaryColor,
                                image: DecorationImage(
                                    image: AssetImage("assets/image/image.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(70)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Agus Priyo",
                                    style: title.copyWith(color: primaryColor)),
                                Text("Front-End Web Developer",
                                    style: heading.copyWith(color: greyColor),
                                    textAlign: TextAlign.end),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: primaryColor, width: 3),
                                color: primaryColor,
                                image: DecorationImage(
                                    image: AssetImage("assets/image/image.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(70)),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: primaryColor, width: 3),
                                color: primaryColor,
                                image: DecorationImage(
                                    image: AssetImage("assets/image/image.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Abdul Qowi",
                                  style: title.copyWith(color: primaryColor)),
                              Text("Back-End Developer",
                                  style: heading.copyWith(color: greyColor))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(70)),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: primaryColor, width: 3),
                                color: primaryColor,
                                image: DecorationImage(
                                    image: AssetImage("assets/image/image.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Eryan Alifa",
                                  style: title.copyWith(color: primaryColor)),
                              Text("Back-End Developer",
                                  style: heading.copyWith(color: greyColor))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: whiteColor,
                      height: 5,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("Aqafe", style: aqafe.copyWith(color: whiteColor)),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )),
          );
        });
  }
}
