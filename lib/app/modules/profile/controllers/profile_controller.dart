import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/ProfileResponse.dart';
import 'package:hsse2/app/data/models/RoleResponse.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';

import '../../../data/providers/user_provider.dart';

class ProfileController extends GetxController
    with StateMixin<ProfileResponse> {
  var userProvider = Get.put(UserProvider());
  var listRole = List<Role>.empty(growable: true);

  late TextEditingController usernameTF;
  late TextEditingController namaTF;
  late TextEditingController emailTF;
  late TextEditingController perusahaanTF;
  late TextEditingController telpTF;
  late TextEditingController roleTF;

  var isEdit = false;

  var idRole = 0;
  var namaRole = "";

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    usernameTF = TextEditingController();
    namaTF = TextEditingController();
    emailTF = TextEditingController();
    perusahaanTF = TextEditingController();
    telpTF = TextEditingController();
    roleTF = TextEditingController();

    getRole();
    getProfile();
  }

  void getRole() {
    try {
      userProvider
          .getRole()
          .then((value) {
            listRole.addAll(value.data!);
            update();
          })
          .onError((error, stackTrace) {
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      DialogAlert.notif("Network Error", "error");
    }
  }

  void getProfile() {

    Future.microtask(() {
      DialogAlert.showLoading(message: "Loading...");
    });
    try {
      userProvider
          .getProfile()
          .then((value) {
            usernameTF.text = value.data!.username!;
            namaTF.text = value.data!.nama!;
            emailTF.text = value.data!.email!;
            perusahaanTF.text = value.data!.perusahaan!;
            telpTF.text = value.data!.telp!;
            idRole = value.data!.idrole!;
            namaRole = value.data!.namarole!;
            roleTF.text = value.data!.namarole!;

            update();
            Get.back();
          })
          .onError((error, _) {
            Get.back();
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      Get.back();
      DialogAlert.notif("Network Error", "error");
    }
  }

  void saveProfile() {
    Future.microtask(() {
      DialogAlert.showLoading(message: "Loading...");
    });
    try {
      userProvider
          .updateProfile(
            usernameTF.text,
            namaTF.text,
            emailTF.text,
            telpTF.text,
            perusahaanTF.text,
            idRole,
          )
          .then((value) {
            Get.back();
            DialogAlert.notif(value.toString(), "success");
          })
          .onError((error, _) {
            Get.back();
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      Get.back();
      DialogAlert.notif("Network Error", "error");
    }
  }
}
