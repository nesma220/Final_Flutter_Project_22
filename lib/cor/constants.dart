import 'package:flutter/material.dart';

class Constants {
  static SizedBox sizedBox({double? width, double? higth}) {
    return SizedBox(
      width: width,
      height: higth,
    );
  }

  static ButtonStyle elevatedButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.purple, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), 
      ),
      minimumSize: const Size(double.infinity, 60), 
      padding: const EdgeInsets.symmetric(vertical: 15), 
    );
  }
}

bool isLoggedin = false;
bool isDark = false;
String userName = "";
String email = "";
String profilePicture = "";
const String stripePublishableKey = "pk_test_51Qn0XpGjlpWcjDmQ34LVJFfYUgoK6IZGBS5MB0YCGpbuKT5VxGmxlPanA0bKiYgGqXB3Vzb7K4aCtEUtRLbw2hoa00fTVHxYW0";
const String stripeSecretKey = "sk_test_51Qn0XpGjlpWcjDmQgKdcPSxa8vPCFRFTg7kxOawXwZgGSRQ26Dx0IvsNDDaWgs1qfXyeSVpUoqJ68MMAssrALVsy00sQa32YZK";
