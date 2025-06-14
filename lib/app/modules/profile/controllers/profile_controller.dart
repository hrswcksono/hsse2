import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/RoleResponse.dart';

import '../../../data/providers/user_provider.dart';

class ProfileController extends GetxController {
  var userProvider = Get.put(UserProvider());
  var listRole = List<Role>.empty(growable: true);

  late TextEditingController usernameTF;
  late TextEditingController namaTF;
  late TextEditingController emailTF;
  late TextEditingController perusahaanTF;
  late TextEditingController telpTF;

  late TextEditingController passwordLamaTF;
  late TextEditingController passwordBaruTF;
  late TextEditingController passwordBaruConfirmTF;

  var isEdit = false;

  var idRole = 0;
  var namaRole = "";

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
