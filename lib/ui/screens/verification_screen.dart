import 'package:final_project/ui/screens/create_new_password_screen.dart';
import 'package:final_project/ui/widget/custom_test_filed.dart';
import 'package:final_project/view_models/VerificationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatelessWidget {
  final VerificationController controller = Get.put(VerificationController());

  VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // استلام الخيار من الصفحة الأولى
    final String selectedOption = Get.arguments ?? 'sms';

    // تحديد النص بناءً على الخيار
    String displayText;
    if (selectedOption == 'email') {
      displayText = "Code has been sent to and***ley@yourdomain.com";
    } else {
      displayText = "Code has been sent to +1 111 ******99";
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Text(
                displayText,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => OtpInputField(index: index),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => Center(
                  child: Text(
                    "Resend code in ${controller.timer}s",
                    style: const TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: controller.verifyCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: TextButton(
                    onPressed: () {
                      Get.to(CreateNewPasswordScreen());
                    },
                    child: const Text(
                      "Verify",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
