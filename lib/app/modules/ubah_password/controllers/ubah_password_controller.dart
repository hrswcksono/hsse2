import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahPasswordController extends GetxController {
  //TODO: Implement UbahPasswordController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  void saveNewPassword() {
    if (newPassword.text != confirmPassword.text) {
      Get.snackbar("Error", "Password baru dan konfirmasi tidak cocok");
    } else {
      // Add your password update logic here
      print("Old: ${oldPassword.text}, New: ${newPassword.text}");
      Get.snackbar("Sukses", "Password berhasil diubah");
    }
  }
}
