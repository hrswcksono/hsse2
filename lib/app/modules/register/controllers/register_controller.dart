import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/RoleResponse.dart';
import 'package:hsse2/app/data/providers/auth_provider.dart';

import '../../../data/providers/user_provider.dart';
import '../../../widgets/dialog_alert.dart';

class RegisterController extends GetxController {
  var listRole = List<Role>.empty(growable: true);
  var userProvider = Get.put(UserProvider());
  var authProvider = Get.put(AuthProvider());

  late TextEditingController usernameTF;
  late TextEditingController namaTF;
  late TextEditingController emailTF;
  late TextEditingController perusahaanTF;
  late TextEditingController telpTF;
  late TextEditingController passwordTF;
  late TextEditingController passwordConfirmTF;

  Role? selectedJob;

  var idRole = 0;

  @override
  void onInit() {
    super.onInit();
    usernameTF = TextEditingController();
    namaTF = TextEditingController();
    emailTF = TextEditingController();
    perusahaanTF = TextEditingController();
    telpTF = TextEditingController();
    passwordTF = TextEditingController();
    passwordConfirmTF = TextEditingController();
    getRole();
  }

  void getRole() {
    Future.microtask(() {
      DialogAlert.showLoading(message: "Loading...");
    });
    try {
      userProvider
          .getRole()
          .then((value) {
            listRole.addAll(value.data!);
            update();
            Get.back();
          })
          .onError((error, stackTrace) {
            Get.back();
          });
    } catch (e) {
      Get.back();
    }
  }

  void submitRegister() {
    if (usernameTF.text == "") {
      DialogAlert.notif("Username Belum Diisi", "warning");
      return;
    }
    if (namaTF.text == "") {
      DialogAlert.notif("Nama Belum Diisi", "warning");
      return;
    }
    if (emailTF.text == "") {
      DialogAlert.notif("Email Belum Diisi", "warning");
      return;
    }
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(emailTF.text);

    if (!emailValid) {
      DialogAlert.notif("Email Tidak Valid", "warning");
      return;
    }
    if (telpTF.text == "") {
      DialogAlert.notif("Telphone Belum Diisi", "warning");
      return;
    }
    if (idRole == 0) {
      DialogAlert.notif("Role Belum Dipilih", "warning");
      return;
    }
    if (passwordTF.text == "") {
      DialogAlert.notif("Password Belum Diisi", "warning");
      return;
    }
    if (passwordConfirmTF.text == "") {
      DialogAlert.notif("Password Konfirmasi Belum Diisi", "warning");
      return;
    }
    if (passwordConfirmTF.text != passwordTF.text) {
      DialogAlert.notif("Password Konfirmasi Tidak Sama", "warning");
      return;
    }
    Future.microtask(() {
      DialogAlert.showLoading(message: "Loading...");
    });
    try {
      authProvider
          .register(
            usernameTF.text,
            namaTF.text,
            emailTF.text,
            telpTF.text,
            perusahaanTF.text,
            passwordTF.text,
            idRole,
          )
          .then((value) {
            Get.back();
            Get.back();
            DialogAlert.notif("Berhasil Menambahkan User", "success");
          })
          .onError((error, stackTrace) {
            Get.back();
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      Get.back();
      DialogAlert.notif(e.toString(), "error");
    }
  }
}
