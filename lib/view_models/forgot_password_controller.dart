import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var selectedOption = "".obs;

  void updateSelectedOption(String option) {
    selectedOption.value = option;
  }
}
