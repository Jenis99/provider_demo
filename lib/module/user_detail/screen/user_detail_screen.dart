import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider_demo/module/post_search_api/controller/item_controller.dart';
import 'package:provider_demo/util/app_string.dart';
import 'package:provider_demo/util/app_text.dart';
import 'package:provider_demo/util/color_resources.dart';
import 'package:provider_demo/util/image_resource.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final ItemController _itemController = Get.find();
  RxInt index = 0.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index.value = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      appBar: AppBar(
        title: AppText(text: AppString.userDetail),
        backgroundColor: ColorRes.blackColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Obx(
                () => Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                              width: 120.h,
                              height: 120.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: (_itemController.itemList[index.value].thumbnailUrl?.isEmpty ?? true)
                                        ? AssetImage(ImageRes.profileImg)
                                        : _itemController.isNetworkImage(_itemController.itemList[index.value].thumbnailUrl ?? "")
                                            ? NetworkImage(_itemController.itemList[index.value].thumbnailUrl ?? "")
                                            : FileImage(File(_itemController.itemList[index.value].thumbnailUrl ?? "")) as ImageProvider,
                                    fit: BoxFit.cover),
                              ),),
                        Positioned(
                            bottom: 1,
                            right: 4,
                            child: (_itemController.isNetworkImage(_itemController.itemList[index.value].thumbnailUrl ?? ""))
                                  ? const SizedBox()
                                  : GestureDetector(
                                onTap: () async {
                                  AlertDialog alert = AlertDialog(
                                    title: AppText(
                                      text: AppString.selectImg,
                                      color: ColorRes.blackColor,
                                    ),
                                    content: AppText(text: AppString.selectImgFrom, color: ColorRes.blackColor),
                                    actions: [
                                      IconButton(
                                          onPressed: () async {
                                            Get.back();
                                            _itemController.itemList[index.value].thumbnailUrl = await _itemController.pickCameraImage();
                                            _itemController.itemList.refresh();
                                          },
                                          icon: const Icon(Icons.camera)),
                                      IconButton(
                                          onPressed: () async {
                                            Get.back();
                                            _itemController.itemList[index.value].thumbnailUrl = await _itemController.pickGalleryImage();
                                            _itemController.itemList.refresh();
                                          },
                                          icon: const Icon(Icons.image))
                                    ],
                                  );
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                },
                                child: Image.asset(ImageRes.cameraImg)),
                            ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AppText(
                        text: _itemController.itemList[index.value].title ?? "",
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
