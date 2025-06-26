import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/providers/user_provider.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';

class UbahPasswordController extends GetxController {
  var userProvider = Get.put(UserProvider());

  late TextEditingController passwordLamaTF;
  late TextEditingController passwordBaruTF;
  late TextEditingController passwordBaruConfirmTF;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    passwordLamaTF = TextEditingController();
    passwordBaruTF = TextEditingController();
    passwordBaruConfirmTF = TextEditingController();
  }

  void ubahPassword() {
    if (passwordLamaTF.text == "") {
      DialogAlert.notif("Password Lama Belum Diisi", "warning");
      return;
    }
    if (passwordBaruTF.text == "") {
      DialogAlert.notif("Password Baru Belum Diisi", "warning");
      return;
    }
    if (passwordBaruConfirmTF.text == "") {
      DialogAlert.notif("Konfirmasi Password Baru Belum Diisi", "warning");
      return;
    }
    if (passwordBaruConfirmTF.text != passwordBaruTF.text) {
      DialogAlert.notif("Konfirmasi Password Tidak Sama", "warning");
      return;
    }
    try {
      userProvider
          .ubahPassword(
            passwordLamaTF.text,
            passwordBaruTF.text,
            passwordBaruConfirmTF.text,
          )
          .then((value) {
            Get.back();
            DialogAlert.notif(value.toString(), "success");
          })
          .onError((error, _) {
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      DialogAlert.notif("Network Error", "error");
    }
  }
}
