import 'package:final_project/ui/screens/HomeScreen.dart';
import 'package:final_project/ui/screens/bookmark_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomeScreen(),
    MyBookmarkScreen(), // تأكد من استخدام نفس الشاشة
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
