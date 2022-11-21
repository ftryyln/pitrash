import 'package:final_project/const/color.dart';
import 'package:final_project/const/font_weight.dart';
import 'package:final_project/const/text_style.dart';
import 'package:final_project/ui/education/detail/education_detail_screen.dart';
import 'package:final_project/ui/education/education_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EducationController>(
        builder: (controller) => Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
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
                  SliverToBoxAdapter(
                    child: Column(
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
                            child: Image.asset(
                                "assets/image/education/education.png",
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 172,
                            child: GestureDetector(
                              onTap: () => {
                                Get.to(() => const EducationDetailScreen()),
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Card(
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
                                        child: Image.network(
                                          controller.educationModel?.data?[index].image ??
                                              "https://",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 8,
                                          bottom: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              controller.educationModel?.data?[index].title ?? "No Title",
                                              style: body.copyWith(
                                                  color: blackColor,
                                                  fontWeight: semiBold),
                                              maxLines: 2,
                                              overflow: TextOverflow.visible),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            DateFormat("dd MMMM yyy").format(DateFormat("yyyy-MM-ddTHH:mm:ss.000000Z").parse(controller.educationModel?.data?[0].createdAt ??'-')),
                                            style: body.copyWith(
                                                color: greyColor,
                                                fontWeight: medium),
                                          ),
                                          Text(
                                              DateFormat("HH:mm").format(DateFormat("yyyy-MM-ddTHH:mm:ss.000000Z").parse(controller.educationModel?.data?[0].createdAt ??'-')),
                                            style: body.copyWith(
                                                color: greyColor,
                                                fontWeight: medium),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )))
                ],
              ),
            ));
  }
}
