import 'dart:typed_data';

import 'package:final_project/cor/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FillProfileController extends GetxController {
  var fullName = ''.obs;
  var nickname = ''.obs;
  var dateOfBirth = ''.obs;
  var userEmail = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;
  var profileImage = Rxn<Uint8List>(); // صورة الملف الشخصي

  @override
  void onInit() {
    super.onInit();
    loadProfileData(); // تحميل البيانات عند تهيئة الـ Controller
  }

  Future<void> saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullName.value);
    await prefs.setString('nickname', nickname.value);
    await prefs.setString('dateOfBirth', dateOfBirth.value);
    await prefs.setString('email', userEmail.value);
    await prefs.setString('phoneNumber', phoneNumber.value);
    await prefs.setString('address', address.value);

    userName = fullName.value;
    profilePicture = String.fromCharCodes(profileImage.value!);
    email = userEmail.value;

    if (profileImage.value != null) {
      await prefs.setString(
          'profileImage', String.fromCharCodes(profileImage.value!));
    }
  }

  Future<void> loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    fullName.value = prefs.getString('fullName') ?? '';
    nickname.value = prefs.getString('nickname') ?? '';
    dateOfBirth.value = prefs.getString('dateOfBirth') ?? '';
    userEmail.value = prefs.getString('email') ?? '';
    phoneNumber.value = prefs.getString('phoneNumber') ?? '';
    address.value = prefs.getString('address') ?? '';

    String imageData = prefs.getString('profileImage') ?? '';
    profileImage.value = Uint8List.fromList(imageData.codeUnits);
  }

  // تحديث الحقول
  void updateFullName(String value) => fullName.value = value;
  void updateNickname(String value) => nickname.value = value;
  void updateDateOfBirth(String value) => dateOfBirth.value = value;
  void updateEmail(String value) => userEmail.value = value;
  void updatePhoneNumber(String value) => phoneNumber.value = value;
  void updateAddress(String value) => address.value = value;

  void updateProfileImage(Uint8List image) {
    profileImage.value = image;
    saveProfileData();
  }

  // التحقق من صحة البيانات
  bool validateFields() {
    if (fullName.value.isEmpty ||
        nickname.value.isEmpty ||
        dateOfBirth.value.isEmpty ||
        userEmail.value.isEmpty ||
        phoneNumber.value.isEmpty ||
        address.value.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (!GetUtils.isEmail(userEmail.value)) {
      Get.snackbar('Error', 'Please enter a valid email',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (phoneNumber.value.length < 8) {
      Get.snackbar('Error', 'Please enter a valid phone number',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    return true;
  }

  void submitProfile() {
    if (validateFields()) {
      saveProfileData();

      Get.snackbar('Success', 'Profile updated successfully',
          backgroundColor: Colors.green, colorText: Colors.white);

      Get.offNamed('/profile');
    }
  }
}
