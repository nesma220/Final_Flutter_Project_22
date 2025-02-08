import 'package:final_project/ui/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emaillogin = ''.obs;
  var passwordlogin = ''.obs;
  var rememberMelogin = false.obs;
  var isPasswordVisiblelogin = false.obs;

  void toggleRememberMe(bool? value) {
    rememberMelogin.value = !rememberMelogin.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisiblelogin.value = !isPasswordVisiblelogin.value;
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void loginAccount() {
    if (emaillogin.isEmpty || passwordlogin.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and password cannot be empty",
        backgroundColor: Colors.red.withOpacity(0.5),
        colorText: Colors.white,
      );
    } else if (!isValidEmail(emaillogin.value)) {
      Get.snackbar(
        "Error",
        "Please enter a valid email address",
        backgroundColor: Colors.red.withOpacity(0.5),
        colorText: Colors.white,
      );
    } else {
      // إذا كان البريد الإلكتروني وكلمة المرور صالحين
      Get.snackbar(
        "Success",
        "Login successful!",
        backgroundColor: Colors.green.withOpacity(0.5),
        onTap: (snack) => Get.off(() => HomeScreen()), // تذهب إلى HomeScreen
        colorText: Colors.white,
      );
    }
  }
}
