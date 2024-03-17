import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_demo/module/auth/controller/login_controller.dart';
import 'package:provider_demo/util/app_string.dart';
import 'package:provider_demo/util/color_resources.dart';
import 'package:provider_demo/util/custom_widget/custom_button.dart';
import 'package:provider_demo/util/custom_widget/custom_textfiled.dart';

class LogInScreen extends StatelessWidget {
  final LogInController _logInController = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.backgroundColor,
        body: SafeArea(
          maintainBottomViewPadding: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextfield(
                  hintText: AppString.enterPhone,
                  keyType: TextInputType.phone,
                  controller: _logInController.phone,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      top: 18.0,
                    ),
                    child: Obx(
                      () => CustomButton(
                        text: AppString.generateOtp,
                        isLoading: _logInController.isLoading.value,
                        onTap: () async {
                          _logInController.verifyPhoneNumber(context);
                        },
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
