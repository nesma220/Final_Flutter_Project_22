import 'package:final_project/ui/screens/verification_screen.dart';
import 'package:final_project/view_models/forgot_password_controller.dart';
import 'package:final_project/ui/widget/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
// Import your controller

class ForgotPasswordScreen extends StatelessWidget {
  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());

  final String method = "email";

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 7),
                  const Text(
                    "Forgot Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),

              Center(
                child: Image.asset(
                  'assets/images/pass.png',
                  width: 250,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Select which contact details should we use to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),

              GestureDetector(
                onTap: () => controller.updateSelectedOption("sms"),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: controller.selectedOption.value == "sms"
                            ? Colors.purple
                            : Colors.grey[300]!,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.sms, color: Colors.purple),
                        SizedBox(width: 10),
                        Text("via SMS: +1 111 *****99"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              GestureDetector(
                onTap: () => controller.updateSelectedOption("email"),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: controller.selectedOption.value == "email"
                            ? Colors.purple
                            : Colors.grey[300]!,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.email, color: Colors.purple),
                        SizedBox(width: 10),
                        Text("via Email: and***ley@yourdomain.com"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              Center(
                child: SignInButton(
                  text: "Continue",
                  color: Colors.purple,
                  Textcolor: Colors.white,
                  onPressed: () {
                    if (controller.selectedOption.value.isEmpty) {
                      Get.snackbar("Error", "Please select an option",
                          backgroundColor: Colors.red.withOpacity(0.5),
                          colorText: Colors.white);
                    } else {
                      Get.to(
                        VerificationScreen(),
                        arguments: controller.selectedOption.value,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
