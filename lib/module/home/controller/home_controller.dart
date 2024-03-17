import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider_demo/module/home/model/movies_model.dart';
import 'package:provider_demo/util/helper/api_handler.dart';
import 'package:provider_demo/util/helper/error_handler.dart';
import 'package:provider_demo/util/utils.dart';

class HomeController extends GetxController {
  RxList<Results> filteredList = <Results>[].obs;
  RxList<Results> dataList = <Results>[].obs;
  RxBool isLoading = false.obs;
  RxInt page = 1.obs;
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  TextEditingController homeSearchBar = TextEditingController();
  List list = [];
  List listSecond = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllData();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        page++;
        getAllData();
      }
    });
    searchController.addListener(() {
      filteredList.value =
          dataList.where((result) => result.originalTitle?.toLowerCase().contains(searchController.text.toLowerCase()) ?? false).toList();
    });
  }

  getAllData() async {
    isLoading(true);
    try {
      await ApiHandler.getRequest(Utils.getNextPage(index: page.value)).then((value) async {
        if (dataList.isEmpty) {
          dataList.value = value.results ?? [];
        } else {
          await Future.delayed(const Duration(seconds: 2));
          dataList.addAll(value.results ?? []);
        }
      });
      isLoading(false);
    } on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //redirect to no internet page
      } else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }
  }
}
