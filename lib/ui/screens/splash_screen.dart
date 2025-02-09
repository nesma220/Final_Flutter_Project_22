import 'package:final_project/ui/screens/onbording_screen.dart'; // استيراد صفحة Onboarding
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // الانتقال إلى صفحة Onboarding بعد 3 ثوانٍ
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpeg', 
              height: 120,
            ),
            const SizedBox(height: 400),
            const CircularProgressIndicator(
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
