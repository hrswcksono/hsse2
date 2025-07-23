import 'dart:io';

import 'package:get/get.dart';
import 'package:hsse2/app/data/providers/permit_provider.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:image_picker/image_picker.dart';

class PermitSelesaiController extends GetxController {
  var permitProvider = Get.put(PermitProvider());

  var idpermit = 0;

  RxBool pekerjaanSelesai = false.obs;
  RxBool pekerjaanPermitBaru = false.obs;

  final ImagePicker picker = ImagePicker();
  Rx<File?> imageFile = Rx<File?>(null);

  Future<void> pickImage() async {
    final XFile? picked = await picker.pickImage(
      source: ImageSource.gallery,
    ); // atau ImageSource.camera
    if (picked != null) {
      imageFile.value = File(picked.path);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  void donePermit() {
    var status = 0;
    if (pekerjaanSelesai.value) {
      status = 1; // Pekerjaan Selesai
    } else if (pekerjaanPermitBaru.value) {
      status = 2; // Pekerjaan Membutuhkan Permit Baru
    }

    if (imageFile.value == null && status == 1) {
      DialogAlert.notif(
        "Silahkan upload atau ambil TTD terlebih dahulu",
        "error",
      );
      return;
    }

    try {
      permitProvider
          .donePermit(idpermit, imageFile.value, status)
          .then((value) {
            DialogAlert.notif(value, "success");
          })
          .onError((error, _) {
            Get.back();
            Get.back();
            Get.back();
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      Get.back();
      DialogAlert.notif(e.toString(), "error");
    }
  }
}
