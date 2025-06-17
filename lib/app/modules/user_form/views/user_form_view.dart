import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/utils/values/colors.dart';

import '../controllers/user_form_controller.dart';

class UserFormView extends GetView<UserFormController> {
  const UserFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: "Tambah Akun",
        pBgColor: CustomColor.appBarColor,
      ),
      body: const Center(
        child: Text(
          'UserFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
