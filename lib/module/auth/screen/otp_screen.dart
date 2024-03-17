import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:get/get.dart';
import 'package:provider_demo/module/auth/controller/login_controller.dart';
import 'package:provider_demo/util/app_string.dart';
import 'package:provider_demo/util/app_text.dart';
import 'package:provider_demo/util/color_resources.dart';

class OtpScreen extends StatelessWidget {
  final LogInController _logInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: AppText(
                text: AppString.enterOtp,
                fontSize: 20.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: OTPTextField(
                  controller: _logInController.otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  otpFieldStyle: OtpFieldStyle(focusBorderColor: ColorRes.whiteColor //(here)
                      ),
                  outlineBorderRadius: 15,
                  style: const TextStyle(fontSize: 17),
                  onCompleted: (pin) {
                    _logInController.verifyOTP(context, pin);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
