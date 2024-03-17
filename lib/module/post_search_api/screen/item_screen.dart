import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_demo/module/post_search_api/controller/item_controller.dart';
import 'package:provider_demo/util/app_string.dart';
import 'package:provider_demo/util/app_text.dart';
import 'package:provider_demo/util/color_resources.dart';
import 'package:provider_demo/util/custom_widget/custom_textfiled.dart';
import 'package:provider_demo/util/image_resource.dart';
import 'package:provider_demo/util/routes.dart';

class ItemScreen extends StatelessWidget {
  final ItemController _itemController = Get.put(ItemController());

  ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => CustomTextfield(
                controller: _itemController.searchController.value,
                keyType: TextInputType.text,
                hintText: AppString.search,
                onChanged: _itemController.onSearchChanged,
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorRes.whiteColor,
                ),
              ),
            ),
            Expanded(
                child: Obx(
              () => _itemController.isLoading.value
                  ? (Center(
                      child: CircularProgressIndicator(
                        color: ColorRes.whiteColor,
                      ),
                    ))
                  : (_itemController.itemList.isEmpty)
                      ? (Center(
                          child: AppText(
                            text: AppString.noData,
                          ),
                        ))
                      : ListView.builder(
                          controller: _itemController.scrollController,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: _itemController.itemList.length,
                          itemBuilder: (context, index) {
                            var dataItem = _itemController.itemList[index];
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var currentFocus = FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                                      FocusManager.instance.primaryFocus!.unfocus();
                                    }
                                    Get.toNamed(Routes.userDetailScreen, arguments: index);
                                  },
                                  child: ListTile(
                                    title: AppText(text: dataItem.title ?? ""),
                                    subtitle: AppText(text: dataItem.entityId ?? ""),
                                    leading: CircleAvatar(
                                        backgroundImage: (dataItem.thumbnailUrl?.isNotEmpty ?? false)
                                            ? _itemController.isNetworkImage(dataItem.thumbnailUrl ?? "")
                                                ? NetworkImage(
                                                    dataItem.thumbnailUrl ?? "",
                                                  )
                                                : FileImage(File(dataItem.thumbnailUrl ?? "")) as ImageProvider
                                            : AssetImage(ImageRes.profileImg)),
                                    trailing: (dataItem.isTrusted ?? false)
                                        ? ImageIcon(
                                            AssetImage(ImageRes.verifyTick),
                                            color: ColorRes.blueTick,
                                          )
                                        : const SizedBox(),
                                  ),
                                ),
                                ((index + 1) == _itemController.itemList.length)
                                    ? (Center(
                                        child: CircularProgressIndicator(
                                          color: ColorRes.whiteColor,
                                        ),
                                      ))
                                    : const SizedBox()
                              ],
                            );
                          },
                        ),
            )),
          ],
        ),
      ),
    );
  }
}
