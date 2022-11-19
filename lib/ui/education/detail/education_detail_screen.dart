import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/education/detail/education_detail_controller.dart';
import 'package:final_project/ui/education/education_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EducationDetailScreen extends StatelessWidget {
  const EducationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EducationDetailController>(
        init: EducationDetailController(),
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
              title: Text("Author", style: title),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(children: [
                        Image.asset(
                          "assets/image/image.jpg",
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 190,
                          left: 8,
                          right: 100,
                          bottom: 8,
                          child: Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                                color: blackColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text("Pengelolaan Sampah di Kota Banjar",
                                  style: titleArticle,
                                  maxLines: 2,
                                  overflow: TextOverflow.visible),
                            ),
                          ),
                        ),
                      ])),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: 300,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/vector/line.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 230,
                      height: 20,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child:
                              Text("18 November 2022, 03:30 PM", style: tiny.copyWith(color: secondaryColor, fontWeight: bold)))),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      "Jumlah sampah terus bertembah seiring dengan berjalannya waktu. Jika tidak ditanggulangi, maka bukan hal yang tak mungkin jika sampah memenuhi seluruh permukaan Bumi. Oleh karena itu manusia mulai melaukan pengelolaan sampah."
                      "Dalam pengelolaan sampah dikenal prinsip 3R yaitu reduce, reuse, dan recycle. Apakah pengertian sesungguhnya dari prinsip 3R dan apa manfaatnya bagi kehidupan?",
                      style: body,
                      textAlign: TextAlign.justify),
                ],
              ),
            ),
          );
        });
  }
}
