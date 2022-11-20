import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/education/detail/education_detail_screen.dart';
import 'package:final_project/ui/education/education_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EducationController>(
      init: EducationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
            title: Text("Pengetahuan",
                style: title.copyWith(fontWeight: semiBold)),
            centerTitle: true,
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
          body: Column(
            children: [
              Card(
                elevation: 5,
                shadowColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 333,
                  width: 408,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("assets/image/education/education.png",
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 172,
                      child: GestureDetector(
                        onTap: () => {
                          Get.to(() => const EducationDetailScreen()),
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 172,
                                height: 172,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Image.asset(
                                    "assets/image/image.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 8, bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Pengelolaan Sampah di Kota Banjar.",
                                        style: body.copyWith(
                                            color: blackColor, fontWeight: semiBold),
                                        maxLines: 2,
                                        overflow: TextOverflow.visible),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "16 November 2022",
                                      style: body.copyWith(
                                          color: greyColor, fontWeight: medium),
                                    ),
                                    Text(
                                      "02:41 AM",
                                      style: body.copyWith(
                                          color: greyColor, fontWeight: medium),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 172,
                      child: GestureDetector(
                        onTap: () => {
                          Get.to(() => const EducationDetailScreen()),
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 172,
                                height: 172,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Image.asset(
                                    "assets/image/image.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 8, bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Pengelolaan Sampah di Kota Banjar.",
                                        style: body.copyWith(
                                            color: blackColor, fontWeight: semiBold),
                                        maxLines: 2,
                                        overflow: TextOverflow.visible),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "16 November 2022",
                                      style: body.copyWith(
                                          color: greyColor, fontWeight: medium),
                                    ),
                                    Text(
                                      "02:41 AM",
                                      style: body.copyWith(
                                          color: greyColor, fontWeight: medium),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
