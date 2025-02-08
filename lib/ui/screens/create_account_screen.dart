import 'package:final_project/cor/constants.dart';
import 'package:final_project/ui/widget/custom_test_filed.dart';
import 'package:final_project/view_models/create_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountScreen extends StatelessWidget {
  final CreateAccountController controller = Get.put(CreateAccountController());

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create your Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Join us and create your account",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),

                CustomTextField(
                  controller: userNameController,
                  hintText: "Full Name",
                  icon: Icons.person_outline,
                  validator: (value) => validateField(value ?? '', 'Full Name'),
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: phoneController,
                  hintText: "Phone Number",
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      validateField(value ?? '', 'Phone Number'),
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      final email = emailController.text.trim();
                      if (!formState.currentState!.validate()) return;
                      controller.checkIfEmailExists(email);
                    },
                  ),
                  validator: (value) => validateField(value ?? '', 'Email'),
                ),

                const SizedBox(height: 20),

                Obx(() => CustomTextField(
                      controller: passwordController,
                      hintText: "Password",
                      icon: Icons.lock_outline,
                      obscureText: !controller.isPasswordVisible.value,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        icon: Icon(controller.isPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      validator: (value) =>
                          validateField(value ?? '', 'Password'),
                    )),

                const SizedBox(height: 20),

                Obx(() => Row(
                      children: [
                        Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: controller.toggleRememberMe,
                          activeColor: Colors.purple,
                        ),
                        const Text("Remember me",
                            style: TextStyle(fontSize: 16)),
                      ],
                    )),

                const SizedBox(height: 20),

                Obx(() => ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () async {
                              if (!formState.currentState!.validate()) return;

                              await controller.createAccount(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                userNameController.text.trim(),
                                phoneController.text.trim(),
                              );
                              var prefs = await SharedPreferences.getInstance();
                              userName = userNameController.text;
                              await prefs.setString(
                                  'fullName', userNameController.text);

                              isLoggedin = true;
                              await prefs.setBool('isLoggedin', true);

                              email = emailController.text;
                              await prefs.setString(
                                  'email', emailController.text);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7210FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    )),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/login");
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color(0xFF7210FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Validation Function
  String? validateField(String value, String fieldName) {
    if (value.isEmpty) {
      return '$fieldName is required';
    }
    if (fieldName == 'Email' && !GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
