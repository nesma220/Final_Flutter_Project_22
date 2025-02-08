import 'package:get/get.dart';

class VerificationController extends GetxController {
  var timer = 60.obs;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() async {
    for (int i = 60; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      timer.value = i;
    }
  }

  void verifyCode() {
    // Add verification logic here
    print("Code verified");
  }
}
