import 'package:final_project/cor/constants.dart';
import 'package:final_project/ui/screens/SecurityScreen.dart';
import 'package:final_project/ui/screens/login_screen_ready.dart';
import 'package:final_project/ui/screens/profile_screen.dart';
import 'package:final_project/view_models/payment_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    RxBool isDarkMode = false.obs; // للتحكم في الوضع الداكن

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFF7210FF),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // صورة المستخدم
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                child: profilePicture == ''
                    ? const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey,
                      )
                    : Image.network(profilePicture),
              ),
              const SizedBox(height: 20),

              // اسم المستخدم
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),

              Text(
                email,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

              // خيارات القائمة
              ListTile(
                leading: const Icon(Icons.edit, color: Color(0xFF7210FF)),
                title: const Text("Edit Profile"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Get.to(() => const FillProfileScreen());
                },
              ),
              const Divider(),

              ListTile(
                leading: const Icon(Icons.payment, color: Color(0xFF7210FF)),
                title: const Text("Payment"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  controller.makePayment();
                },
              ),
              const Divider(),

              Obx(() {
                return SwitchListTile(
                  title: const Text("Dark Mode"),
                  value: isDarkMode.value,
                  onChanged: (value) {
                    isDarkMode.value = value;
                    Get.changeTheme(
                      value ? ThemeData.dark() : ThemeData.light(),
                    );
                  },
                  secondary:
                      const Icon(Icons.dark_mode, color: Color(0xFF7210FF)),
                );
              }),
              const Divider(),

              ListTile(
                leading: const Icon(Icons.lock, color: Color(0xFF7210FF)),
                title: const Text("Security"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Get.to(() => const SecurityScreen());
                },
              ),
              const Divider(),

              // تسجيل الخروج
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Get.defaultDialog(
                    title: "Logout",
                    middleText: "Are you sure you want to logout?",
                    textCancel: "Cancel",
                    textConfirm: "Logout",
                    confirmTextColor: Colors.white,
                    onConfirm: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.offAll(LoginScreenReady());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
