import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_demo/module/home/controller/home_controller.dart';
import 'package:provider_demo/module/home/model/movies_model.dart';
import 'package:provider_demo/util/app_string.dart';
import 'package:provider_demo/util/app_text.dart';
import 'package:provider_demo/util/color_resources.dart';
import 'package:provider_demo/util/custom_widget/custom_textfiled.dart';
import 'package:provider_demo/util/routes.dart';
import 'package:provider_demo/util/utils.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomTextfield(
              controller: _homeController.searchController,
              keyType: TextInputType.text,
              hintText: AppString.movieSearch,
              prefixIcon: Icon(
                Icons.search,
                color: ColorRes.whiteColor,
              ),
            ),
            Expanded(
              child: Obx(
                () => (_homeController.filteredList.isEmpty)
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorRes.whiteColor,
                        ),
                      )
                    : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _homeController.filteredList.length,
                      itemBuilder: (context, index) {
                        Results movieDetail = _homeController.filteredList[index];
                        return ListTile(
                          onTap: () {
                             Get.toNamed(Routes.movieScreen,arguments: movieDetail);
                          },
                          title: AppText(
                            text: movieDetail.originalTitle.toString(),
                              color: ColorRes.whiteColor
                          ),
                          subtitle: AppText(text: movieDetail.originalLanguage.toString(),color: ColorRes.whiteColor,),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(Utils.getFullUrl(endPoint: movieDetail.posterPath),)
                          ),
                        );
                      },
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
