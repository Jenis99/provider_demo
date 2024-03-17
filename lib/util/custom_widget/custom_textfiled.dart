import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_demo/util/app_text.dart';
import 'package:provider_demo/util/color_resources.dart';

class CustomTextfield extends StatelessWidget {
  var hintText;
  var name;
  final bool isPassword;
  TextInputType? keyType;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  GestureTapCallback? onTap;
  ValueChanged<String>? onChanged;

  CustomTextfield({Key? key,
    this.name,
    this.controller,
    this.keyType,
    this.hintText,
    this.prefixIcon,
    this.onTap,
    this.suffixIcon,
    this.isPassword = false,
    this.onChanged,
    this.validator});

  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isObscure,
        builder: (context, bool isObscure, _) {
          if (!isPassword) {
            isObscure = false;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (name != null) ? AppText(
                  text: name ?? "",
                  fontSize: 18.sp,
                  color: ColorRes.textColor,
                  fontWeight: FontWeight.w400
              ) : SizedBox(),
              SizedBox(
                height: 6.h,
              ),
              TextFormField(
                style: TextStyle(
                  color: ColorRes.whiteColor
                ),
                decoration: InputDecoration(
                  prefixIcon: prefixIcon,iconColor: ColorRes.whiteColor,
                  suffixIcon: suffixIcon == null && isPassword
                      ? IconButton(
                    icon: Icon(
                      isObscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _isObscure.value = !isObscure;
                    },
                  )
                      : suffixIcon,
                  hintText: hintText,

                  hintStyle: TextStyle(
                    fontSize: 16.sp,color: ColorRes.whiteColor
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.only(
                      top: 12.0, left: 20.0, bottom: 12.0, right: 50.0).w,
                  fillColor: Colors.white24,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(20.0.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(20.0.r),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: const BorderSide(
                      color: ColorRes.textBox,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: const BorderSide(
                      color: ColorRes.textBox,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: const BorderSide(
                      color: ColorRes.textBox,
                    ),
                  ),
                ),
                keyboardType: keyType,

                onTap: onTap,
                onChanged:onChanged,
                // readOnly: ,
                controller: controller,
                obscureText: isObscure,
                validator: validator,
              ),
            ],
          );
        });
  }
}
