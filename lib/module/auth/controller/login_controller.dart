import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:provider_demo/util/app_string.dart';
import 'package:provider_demo/util/routes.dart';

class LogInController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  RxString phoneNumber = "".obs;
  RxString verificationId = "".obs;
  RxString authStatus = "".obs;
  RxString otp = "".obs;
  RxBool isLoading = false.obs;

  TextEditingController phone = TextEditingController();
  OtpFieldController otpController = OtpFieldController();

  Future<void> verifyPhoneNumber(BuildContext context) async {
    isLoading(true);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${phone.text}",
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        authStatus(AppString.accVerified);
      },
      verificationFailed: (FirebaseAuthException authException) {
        authStatus(AppString.accNotVerified);
      },
      codeSent: (String verId, int? resendToken) {
        isLoading(false);
        verificationId(verId);
        authStatus(AppString.otpSend);
        Get.snackbar(AppString.successful, AppString.otpSend);
        Get.toNamed(Routes.otpScreen);
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId(verId);
        authStatus(AppString.timeOut);
      },
    );
  }

  Future<void> verifyOTP(BuildContext context, String pin) async {
    otp(otpController.toString());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: pin);
    await auth.signInWithCredential(credential).then((value) {
      Get.snackbar(AppString.successful, AppString.loginSuccessful);
      Get.offAllNamed(Routes.itemScreen);
    });
  }
}
