import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../const/color.dart';
import '../../../../const/font_weight.dart';
import '../../../../const/text_style.dart';

class PiTrashScreen extends StatefulWidget {
  const PiTrashScreen({Key? key}) : super(key: key);

  @override
  State<PiTrashScreen> createState() => _PiTrashScreenState();
}

class _PiTrashScreenState extends State<PiTrashScreen> {
  @override
  Widget build(BuildContext context) {
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
            child:
                SvgPicture.asset("assets/vector/back.svg", color: whiteColor),
          ),
        ),
      ),
      body: SizedBox(
        height: 900,
        child: Stack(
          children: [
            SvgPicture.asset("assets/vector/bgappbar.svg", fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/vector/logo.svg"),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                          "PiTrash merupakan aplikasi penjadwalan dan pembayaran pengambilan sampah yang disertai dengan pengetahuan terkait dengan pengelolaan sampah agar masyarakat lebih peduli terhadap lingkungan.",
                          style: heading.copyWith(
                              color: blackColor, fontWeight: medium),
                          textAlign: TextAlign.center),
                      //     const SizedBox(
                      //       height: 200,
                      //     ),
                      //     Divider(
                      //         height: 1,
                      //         color: greyColor.withOpacity(0.5),
                      //         thickness: 1),
                      //     const SizedBox(
                      //       height: 30,
                      //     ),
                      //     Text("Kontak Kami",
                      //         style: heading.copyWith(color: greyColor)),
                      //     Padding(
                      //       padding: const EdgeInsets.all(10),
                      //       child: Container(
                      //         height: 50,
                      //         width: Get.width,
                      //         decoration: BoxDecoration(
                      //             color: primaryColor,
                      //             borderRadius: BorderRadius.circular(20)),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             SvgPicture.asset("assets/vector/icon_wa.svg"),
                      //             const SizedBox(
                      //               width: 10,
                      //             ),
                      //             Text("+62 895-6190-19395", style: body)
                      //           ],
                      //         ),
                      //       ),
                      //     )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
