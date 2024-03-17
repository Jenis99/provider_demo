import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_demo/util/app_text.dart';
import 'package:provider_demo/util/color_resources.dart';

class CustomButton extends StatelessWidget {
   bool isLoading;

  final Function() onTap;
  final Color? textColor;
  final String text;
  final double? fontSize;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? borderColor;
  final Widget? child;

  CustomButton({
    Key? key,
    required this.onTap,
    this.textColor,
    this.fontSize,
    this.height,
    this.child,
    this.width,
    this.fontWeight,
    this.color,
    this.borderColor,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 54.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color ?? ColorRes.blackColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: isLoading
            ? SizedBox(
            height: 40.h,
            width: 40.h,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorRes.whiteColor,
              ),
            ))
            : Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Align(
              alignment: Alignment.center,
              child: AppText(
                text: text,
                fontWeight: FontWeight.w400,
                fontSize: 20.sp,
                color: textColor ?? ColorRes.whiteColor,
              )),
        ),
      ),
    );
  }
}
