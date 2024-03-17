import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_demo/module/home/controller/home_controller.dart';
import 'package:provider_demo/module/home/model/movies_model.dart';
import 'package:provider_demo/util/app_text.dart';
import 'package:provider_demo/util/color_resources.dart';
import 'package:provider_demo/util/custom_widget/custom_network_image.dart';
import 'package:provider_demo/util/routes.dart';
import 'package:provider_demo/util/utils.dart';

class CustomListviewBuilder extends StatelessWidget {
  List<Results>? allData;
  ScrollController controller;

  CustomListviewBuilder({super.key, required this.allData, required this.controller});

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.0,
      child: Obx(() => ListView.builder(
            padding: const EdgeInsets.only(top: 8.0),
            scrollDirection: Axis.horizontal,
            controller: controller,
            shrinkWrap: true,
            itemCount: allData?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              Results? viewData = allData?[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.movieScreen, arguments: viewData);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 85,
                                child: CustomNetworkImage(
                                  image: Utils.getFullUrl(endPoint: viewData?.posterPath) ?? "",
                                  borderRadius: BorderRadius.circular(30),
                                  height: 200.0,
                                  width: 140.0,
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: AppText(
                                    maxLines: 2,
                                    text: viewData?.originalTitle ?? "",
                                    fontWeight: FontWeight.bold,
                                    color: ColorRes.whiteColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        ((index + 1) == allData?.length)
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: ColorRes.whiteColor,
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              );
              // }
            },
          )),
    );
  }
}
