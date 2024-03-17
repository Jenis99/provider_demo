import 'package:flutter/material.dart';
import 'package:provider_demo/util/app_string.dart';
import 'package:provider_demo/util/app_text.dart';
import 'package:provider_demo/util/color_resources.dart';

class CustomNetworkImage extends StatelessWidget {
  String image;
  double? width;
  double? height;
  BorderRadiusGeometry? borderRadius;

  CustomNetworkImage(
      {required this.image,
        this.width,
        this.height,
        this.borderRadius,});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(50),
      child: Image.network(
        image,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Center(
            child: Center(child: AppText(text: AppString.checkYourImgUrl))),
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              color: ColorRes.whiteColor,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        // loadingBuilder: (context, child, loadingProgress) =>const Center(child:  CircularProgressIndicator()),
      ),
    );
  }
}
