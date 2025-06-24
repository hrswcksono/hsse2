import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/providers/unsafe_provider.dart';
import 'package:hsse2/app/modules/unsafe_action/controllers/unsafe_action_controller.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hsse2/app/data/models/SoalUnsafeRepsonse.dart';

class UnsafeActionDetailController extends GetxController {
  var unsafeProvider = Get.put(UnsafeProvider());
  var unsafeCtrl = Get.put(UnsafeActionController());
  late TextEditingController namaTF;
  late TextEditingController tglTemuanTF;
  late TextEditingController waktuTF;
  late TextEditingController lokasiTF;
  late TextEditingController picTF;
  var dateTemuanSelected = DateTime.now();

  var listPertanyaan = List<SoalUnsafe>.empty(growable: true);

  var listJawaban = List<dynamic>.empty(growable: true);

  var idJenisUnsafe = 0;
  var idUnsafe      = 0;

  // attachment
  late TextEditingController catatanTF;
  late TextEditingController impacTF;
  late TextEditingController rekomendasiTF;

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

  final TextEditingController lainnyaController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    namaTF = TextEditingController();
    tglTemuanTF = TextEditingController();
    waktuTF = TextEditingController();
    lokasiTF = TextEditingController();
    picTF = TextEditingController();

    catatanTF = TextEditingController();
    impacTF = TextEditingController();
    rekomendasiTF = TextEditingController();
  }

  void selectTanggalTemuan(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      tglTemuanTF.text =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
  }

  void selectWaktu(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      waktuTF.text =
          "${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}";
    }
  }

  void initJawaban() {
    var temp = [];
    for (var i = 0; i < listPertanyaan.length; i++) {
      temp.add({
        'idpertanyaan': listPertanyaan[i].idpertanyaanunsafe,
        'jawaban': false,
      });
    }
    listJawaban.addAll(temp);
    update();
  }

  void changeListJawaban(int idpertanyaan) {
    var index = listJawaban.indexWhere(
      (element) => element["idpertanyaan"] == idpertanyaan,
    );
    listJawaban[index]["jawaban"] = !listJawaban[index]["jawaban"];
    update();
  }

  void getSoalUnsafe(int idSoalUnsafe) {
    listPertanyaan.clear();
    try {
      unsafeProvider
          .getSoalUnsafe(idSoalUnsafe)
          .then((value) {
            listPertanyaan.addAll(value.data!);
            initJawaban();
            update();
          })
          .onError((error, _) {
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      DialogAlert.notif(e.toString(), "error");
    }
  }

  var imageFoto = "";

  void getDetailUnsafe(int idunsafe) {
    try {
      unsafeProvider
          .getDetailUnsafe(idunsafe)
          .then((value) {
            namaTF.text = value.data!.pic.toString();
            waktuTF.text = value.data!.waktu.toString();
            picTF.text = value.data!.pic.toString();
            tglTemuanTF.text = value.data!.tgltemuan!.toString().split(' ')[0];
            lokasiTF.text = value.data!.lokasi.toString();
            catatanTF.text = value.data!.catatan!;
            impacTF.text = value.data!.impac!;
            rekomendasiTF.text = value.data!.rekomendasi!;

            var listJawabanTemp = value.data!.detail;

            for (var i = 0; i < listJawabanTemp!.length; i++) {
              listJawaban.add({
                'idpertanyaan': listJawabanTemp[i].idpertanyaanunsafe,
                'jawaban': true,
              });
            }

            imageFoto = value.data!.dokumentasi.toString();

            print(imageFoto);

            print(listJawaban);

            update();
          })
          .onError((error, _) {
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      DialogAlert.notif(e.toString(), "error");
    }
  }
}
