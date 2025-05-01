import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  final username = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final job = TextEditingController();

  void saveProfile() {
    print("Saving profile:");
    print(username.text);
    // Add your logic here (e.g., API call)
  }

  void changePassword() {
    Get.snackbar("Change Password", "Navigating to change password screen");
    // Add navigation to password change screen
  }
}
