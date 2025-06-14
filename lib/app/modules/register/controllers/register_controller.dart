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

  var selectedJob = ''.obs;

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
    try {
      userProvider
          .getRole()
          .then((value) {
            print(value.data);
            listRole.addAll(value.data!);
            update();
          })
          .onError((error, stackTrace) {
            print(error);
          });
    } catch (e) {
      print(e);
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
    if (perusahaanTF.text == "") {
      DialogAlert.notif("Perusahaan Belum Diisi", "warning");
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
    CircularProgressIndicator();
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
          })
          .onError((error, stackTrace) {
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      DialogAlert.notif(e.toString(), "error");
    }
  }
}
