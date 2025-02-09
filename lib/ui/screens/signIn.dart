import 'package:final_project/view_models/sign_in_controller.dart';
import 'package:final_project/ui/screens/create_account_screen.dart';
import 'package:final_project/ui/screens/login_screen_ready.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Widgets

import 'package:final_project/ui/widget/btn.dart';

class SignInScreen extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Illustration
                SizedBox(
                  height: 150,
                  child: Image.asset('assets/images/loginImage1.jpeg'),
                ),
                const SizedBox(height: 40),
                // Main Text
                const Text(
                  "Let’s you in",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Sign in with options
                Column(
                  children: [
                    SignInButton(
                      text: "Continue with Facebook",
                      color: const Color(0xFF1877F2),
                      icon: Icons.facebook,
                      onPressed: controller.signInWithFacebook,
                    ),
                    const SizedBox(height: 10),
                    SignInButton(
                      text: "Continue with Google    ",
                      color: const Color(0xFF4285F4),
                      icon: Icons.source_rounded,
                      onPressed: controller.signInWithGoogle,
                    ),
                    const SizedBox(height: 10),
                    SignInButton(
                      text: "  Continue with Apple    ",
                      color: const Color(0xFF000000),
                      icon: Icons.apple,
                      onPressed: controller.signInWithApple,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Loading Indicator
                if (controller.isLoading.value)
                  const CircularProgressIndicator(),
                const SizedBox(height: 20),
                // Sign in with password button
                ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null // تعطيل الزر أثناء التحميل
                      : controller.signInWithPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7210FF),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.to(LoginScreenReady());
                    },
                    child: const Text(
                      "      Sign in with password    ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // Sign up link
                TextButton(
                  onPressed: controller.goToSignUpScreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(CreateAccountScreen());
                        },
                        child: const Text(" Sign up",
                            style: TextStyle(
                              color: Color(0xFF7210FF),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
