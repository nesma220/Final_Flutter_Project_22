import 'package:get/get.dart';

class SignInController extends GetxController {
  // مؤشر لتحميل البيانات
  var isLoading = false.obs;

  // تسجيل الدخول باستخدام Facebook
  Future<void> signInWithFacebook() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    print("Signed in with Facebook");
  }

  // تسجيل الدخول باستخدام Google
  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    print("Signed in with Google");
  }

  // تسجيل الدخول باستخدام Apple
  Future<void> signInWithApple() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    print("Signed in with Apple");
  }

  // تسجيل الدخول باستخدام كلمة المرور
  void signInWithPassword() {
    print("Signed in with Password");
    Get.toNamed("/login_ready_screen");
  }

  // الانتقال إلى شاشة إنشاء حساب
  void goToSignUpScreen() {
    print("Navigating to Sign Up screen");
    Get.toNamed("/create_account_screen");
  }
}
