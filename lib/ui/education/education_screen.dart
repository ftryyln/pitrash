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
            body: RefreshIndicator(
              onRefresh: () async {
                controller.update();
              },
              child: CustomScrollView(
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
                    child: Card(
                      elevation: 5,
                      shadowColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: 333,
                        width: 430,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/image/education/education.png",
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      height: 50,
                      width: Get.width,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                        controller: controller.searchController,
                        onChanged: (value) {
                          // filter}
                          if (value.isNotEmpty) {
                            controller.data = controller.data
                                .where((element) =>
                                    element?.title
                                        ?.toLowerCase()
                                        .contains(value.toLowerCase()) ==
                                    true)
                                .toList();
                            controller.update();
                          } else {
                            controller.data.clear();
                            controller.getEducation();
                            controller.update();
                          }
                        },
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10),
                    sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                mainAxisSpacing: 5,
                                mainAxisExtent: 270,
                                crossAxisSpacing: 5),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return GestureDetector(
                            onTap: () => Get.to(
                                () => const EducationDetailScreen(),
                                arguments:
                                    controller.data[index]),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 152,
                                    decoration: const BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      child: Image.network(
                                        controller.data[index]!
                                                .image ??
                                            "/https://",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 8, bottom: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            controller.data[index]?.title ??
                                                "No Title",
                                            style: body.copyWith(
                                                color: blackColor,
                                                fontWeight: semiBold),
                                            maxLines: 2,
                                            overflow: TextOverflow.visible),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          controller.toFormat.format(controller
                                              .formatter
                                              .parse(controller
                                                      .data[index]?.createdAt ??
                                                  "yyyy-MM-ddTHH:mm:ss.000000Z")),
                                          style: tiny.copyWith(
                                              color: greyColor,
                                              fontWeight: medium),
                                        ),
                                        Text(
                                          controller.toClockFormat.format(
                                              controller.formatter.parse(controller
                                                      .data[index]!
                                                      .createdAt ??
                                                  "yyyy-MM-ddTHH:mm:ss.000000Z")),
                                          style: tiny.copyWith(
                                              color: greyColor,
                                              fontWeight: medium),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }, childCount: controller.data.length)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
