import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider_demo/module/post_search_api/model/item_model.dart';
import 'package:provider_demo/module/services/service.dart';

class ItemController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Item> itemList = <Item>[].obs;
  Rx<Search> search = Search().obs;
  ScrollController scrollController = ScrollController();
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxInt pageIndex = 2.obs;
   Rx<Item> userDetail = Item().obs;
   RxString selectedfile = "".obs;
   final ImagePicker _picker = ImagePicker();
  Timer? debounce;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        pageIndex++;
        loadMoreData();
      }
    });
  }

  Future getSearchedData() async {
    isLoading(true);
    try {
      search.value = await SearchService.searchService(pageIndex: pageIndex.value, searchText: searchController.value.text);
      itemList.value = search.value.items ?? [];
      isLoading(false);
    } catch (e) {
      rethrow;
    }
  }

  Future loadMoreData() async {
    try {
      search.value = await SearchService.searchService(pageIndex: pageIndex.value, searchText: searchController.value.text);
      itemList.addAll(search.value.items ?? []);
    } catch (e) {
      rethrow;
    }
  }

  void onSearchChanged(String query) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds:500), () {
       if(searchController.value.text.isNotEmpty){
         getSearchedData();
       }
    });
  }

  bool isNetworkImage(String path) {
    return Uri.parse(path).scheme == 'http' || Uri.parse(path).scheme == 'https';
  }

  bool isAssetImage(String path) {
    return Uri.parse(path).scheme == 'asset';
  }


  Future<String> pickCameraImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    selectedfile.value = photo!.path;
    return selectedfile.value;
  }

  Future<String> pickGalleryImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    selectedfile.value = photo!.path;
    return selectedfile.value;
  }
}
