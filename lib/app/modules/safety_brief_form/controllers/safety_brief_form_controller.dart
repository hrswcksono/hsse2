import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/CuacaResponse.dart';
import 'package:hsse2/app/data/providers/safety_brief_provider.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:image_picker/image_picker.dart';

class SafetyBriefFormController extends GetxController {
  var sbProvider = Get.put(SafetyBriefProvider());
  var listPertanyaan = List<CuacaItem>.empty(growable: true);

  late TextEditingController tglTF;
  late TextEditingController waktuTF;
  late TextEditingController shiftTF;
  late TextEditingController departemenTF;
  late TextEditingController pemateriTF;
  late TextEditingController jmlPekerjaTF;
  late TextEditingController namaPekerjaTF;
  late TextEditingController pekerjaanTF;
  late TextEditingController pembahasanTF;

  var listJawaban = List<dynamic>.empty(growable: true);

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

    tglTF = TextEditingController();
    waktuTF = TextEditingController();
    shiftTF = TextEditingController();
    departemenTF = TextEditingController();
    pemateriTF = TextEditingController();
    jmlPekerjaTF = TextEditingController();
    namaPekerjaTF = TextEditingController();
    pekerjaanTF = TextEditingController();
    pembahasanTF = TextEditingController();

    getCuaca();
  }

  void initJawaban() {
    var temp = [];
    for (var i = 0; i < listPertanyaan.length; i++) {
      temp.add({'idpertanyaan': listPertanyaan[i].idcuaca, 'jawaban': false});
    }
    listJawaban.addAll(temp);
    update();
  }

  void getCuaca() {
    Future.microtask(() {
      DialogAlert.showLoading(message: "Loading...");
    });
    listPertanyaan.clear();
    try {
      sbProvider
          .getCuaca()
          .then((value) {
            listPertanyaan.addAll(value.data!);
            initJawaban();
            update();
            Get.back();
          })
          .onError((error, _) {
            Get.back();
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      Get.back();
      DialogAlert.notif(e.toString(), "error");
    }
  }

  void changeListJawaban(int idpertanyaan) {
    var index = listJawaban.indexWhere(
      (element) => element["idpertanyaan"] == idpertanyaan,
    );
    if (index != -1) {
      listJawaban[index]["jawaban"] = !listJawaban[index]["jawaban"];
    }
    update();
  }

  void selectTanggalTemuan(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      tglTF.text =
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

  void submit() {
    try {
      var datajawaban = [];

      for (var i = 0; i < listJawaban.length; i++) {
        if (listJawaban[i]["jawaban"] == true) {
          datajawaban.add({
            "idcuaca": listJawaban[i]["idpertanyaan"],
            "jawaban": 1,
          });
        }
      }
      Future.microtask(() {
        DialogAlert.showLoading(message: "Loading...");
      });
      sbProvider
          .submitSB(
            tglTF.text,
            shiftTF.text,
            waktuTF.text,
            departemenTF.text,
            pemateriTF.text,
            jmlPekerjaTF.text,
            namaPekerjaTF.text,
            pekerjaanTF.text,
            pembahasanTF.text,
            jsonEncode(datajawaban),
            imageFile.value!,
          )
          .then((value) {
            Get.close(2);
            DialogAlert.notif(value, "success");
          })
          .onError((error, _) {
            Get.back();
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      Get.back();
      DialogAlert.notif(e.toString(), "error");
    }
  }
}
