import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hsse2/app/data/providers/unsafe_provider.dart';
import 'package:hsse2/app/modules/unsafe_action/controllers/unsafe_action_controller.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:hsse2/utils/values/get_storage_key.dart';
import 'package:image_picker/image_picker.dart';

class UnsafeActionApproalController extends GetxController {
  var unsafeProvider = Get.put(UnsafeProvider());
  var unsafeCtrl = Get.put(UnsafeActionController());
  var idJenisUnsafe = 0;
  var idunsafe = 0;

  late TextEditingController konfirmasiTemuanTF;
  late TextEditingController penanggungJawabTF;
  late TextEditingController statusPengerjaanTF;
  late TextEditingController catatanTambahanTF;

  var selectedStatus = 0.obs;
  var konfirmasiTemuan = 0.obs;

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

    konfirmasiTemuanTF = TextEditingController();
    penanggungJawabTF = TextEditingController(
      text: GetStorage().read(GetStorageKey.nama),
    );
    statusPengerjaanTF = TextEditingController();
    catatanTambahanTF = TextEditingController();
  }

  void getDetailUnsafe(int idunsafe) {
    // try {
    //   unsafeProvider
    //       .getDetailUnsafe(idunsafe)
    //       .then((value) {
    //         namaTF.text = value.data!.pic.toString();
    //         waktuTF.text = value.data!.waktu.toString();
    //         picTF.text = value.data!.pic.toString();
    //         tglTemuanTF.text = value.data!.tgltemuan!.toString().split(' ')[0];
    //         lokasiTF.text = value.data!.lokasi.toString();
    //         catatanTF.text = value.data!.catatan!;
    //         impacTF.text = value.data!.impac!;
    //         rekomendasiTF.text = value.data!.rekomendasi!;

    //         var listJawabanTemp = value.data!.detail;

    //         for (var i = 0; i < listJawabanTemp!.length; i++) {
    //           listJawaban.add({
    //             'idpertanyaan': listJawabanTemp[i].idpertanyaanunsafe,
    //             'jawaban': true,
    //           });
    //         }

    //         imageFoto = value.data!.dokumentasi.toString();

    //         print(imageFoto);

    //         print(listJawaban);

    //         update();
    //       })
    //       .onError((error, _) {
    //         DialogAlert.notif(error.toString(), "error");
    //       });
    // } catch (e) {
    //   DialogAlert.notif(e.toString(), "error");
    // }
  }

  void responUnsafe() {
    try {

      unsafeProvider
          .responseUnsafe(
            idunsafe,
            konfirmasiTemuan.value.toString(),
            selectedStatus.value.toString(),
            catatanTambahanTF.text,
            imageFile.value!,
          )
          .then((value) {
            Get.back();
            DialogAlert.notif(value, "success");
            unsafeCtrl.getListUnsafe(idJenisUnsafe);
          })
          .onError((error, _) {
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      DialogAlert.notif(e.toString(), "error");
    }
  }
}
