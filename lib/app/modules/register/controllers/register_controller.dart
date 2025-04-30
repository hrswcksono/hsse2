import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  final username = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  var selectedJob = ''.obs;

  final jobs = ['Admin', 'Manager', 'Staff', 'Security', 'Other'];
}
