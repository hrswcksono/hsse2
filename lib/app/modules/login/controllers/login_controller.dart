import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/routes/app_pages.dart';
import 'package:hsse2/utils/values/get_storage_key.dart';

import '../../../../service/storage_service.dart';
import '../../../data/providers/auth_provider.dart';
import '../../../widgets/dialog_alert.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  late TextEditingController usernameTF;
  late TextEditingController passwordTF;

  final isPasswordHidden = true.obs;

  var authProvider = Get.put(AuthProvider());
  var getService = Get.put(StorageService());

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    usernameTF = TextEditingController();
    passwordTF = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    usernameTF = TextEditingController();
    passwordTF = TextEditingController();
  }

  void submitLogin() {
    if (usernameTF.text == "") {
      DialogAlert.notif("Username Belum Diisi", "warning");
      return;
    }
    if (passwordTF.text == "") {
      DialogAlert.notif("Password Belum Diisi", "warning");
      return;
    }
    try {
      authProvider
          .login(usernameTF.text, passwordTF.text)
          .then((value) {
            getService.write(GetStorageKey.accessToken, value.data!.token);
            getService.write(
              GetStorageKey.namaperusahaan,
              value.data!.perusahaan,
            );
            getService.write(GetStorageKey.nama, value.data!.nama);
            getService.write(GetStorageKey.namarole, value.data!.role);
            getService.write(GetStorageKey.idrole, value.data!.idrole);
            getService.write(GetStorageKey.iduser, value.data!.iduser);
            Get.toNamed(Routes.HOME);
          })
          .onError((error, stackTrace) {
            DialogAlert.notif(error.toString(), "warning");
          });
    } catch (e) {
      DialogAlert.notif("Network Error", "error");
    }
  }
}
