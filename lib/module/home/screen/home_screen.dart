import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/module/home/provider/home_provider.dart';
import 'package:provider_demo/util/app_string.dart';
import 'package:provider_demo/util/app_text.dart';
import 'package:provider_demo/util/color_resources.dart';
import 'package:provider_demo/util/custom_widget/custom_listview_builder.dart';
import 'package:provider_demo/util/custom_widget/custom_textfiled.dart';
import 'package:provider_demo/util/routes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final HomeController _homeController = Get.put(HomeController());
  late HomeProvider _homeProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
        backgroundColor: ColorRes.backgroundColor,
        body: SafeArea(
          child: Obx(
            () => (_homeProvider.dataList.isEmpty ?? false)
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorRes.whiteColor,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: _homeProvider.homeSearchBar,
                          keyType: TextInputType.text,
                          hintText: AppString.movieSearch,
                          onTap: () {
                            Get.toNamed(Routes.searchScreen);
                          },
                          prefixIcon: Icon(
                            Icons.search,
                            color: ColorRes.whiteColor,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: AppText(
                                  text: AppString.actionMovie,
                                  fontSize: 25.0,
                                  color: ColorRes.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomListviewBuilder(
                                controller: _homeProvider.scrollController,
                                allData: _homeProvider.dataList,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ));
  }
}
