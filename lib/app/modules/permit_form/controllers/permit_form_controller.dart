import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/ListSoalPermitResponse.dart';
import 'package:hsse2/app/data/providers/permit_provider.dart';
import 'package:hsse2/app/modules/permit_list/controllers/permit_list_controller.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:image_picker/image_picker.dart';

class PermitFormController extends GetxController {
  var permitProvider = Get.find<PermitProvider>();
  var permitListCtl = Get.put(PermitListController());
  var arguments = Get.arguments;
  late TextEditingController kodePermitTF;
  late TextEditingController namaPemohonTF;
  late TextEditingController bagianTF;
  late TextEditingController perusahaanTF;
  late TextEditingController lokasiTF;
  late TextEditingController tanggalKerjaTF;
  late TextEditingController nomorIjinTF;
  late TextEditingController jumlahPekerjaTF;
  late TextEditingController jamTF;
  late TextEditingController deskripsiTF;
  late TextEditingController namaProjectTF;
  var dateSelected = DateTime.now();

  late TextEditingController tanggalAwalSuratTF;
  var dateSelectedAwalSurat = DateTime.now();
  late TextEditingController tanggalAkhirSuratTF;
  var dateSelectedAkhirSurat = DateTime.now();

  late TextEditingController jamAwalSuratTF;
  var jamAwalSelected = TimeOfDay.now();
  late TextEditingController jamAkhirSuratTF;
  var jamAkhirSelected = TimeOfDay.now();

  late TextEditingController namaPengukurTF;
  late TextEditingController jamPengukurTF;
  var jamPengukuran = TimeOfDay.now();
  late TextEditingController o2TF;
  late TextEditingController coTF;
  late TextEditingController h2sTF;
  late TextEditingController lelTF;

  late TextEditingController pekerjaanSesuaiProsedurTF;
  late TextEditingController pekerjaanTelahDisampaikanTF;
  late TextEditingController lokasiPekerjaanDipastikanAmanTF;

  var pekerjaanSesuaiProsedur = false.obs;
  var pekerjaanTelahDisampaikan = false.obs;
  var lokasiPastiAman = false.obs;

  var listHideSoal = [];

  var listPertanyaan = List<ListSoalPermitData>.empty(growable: true);

  var listjawaban = List<dynamic>.empty(growable: true);

  var idjenispermit = 0;

  var butuhgas = 0;

  var jawabanPersiapanGas = [false, false, false, false];

  void changeCheckPersiapanGas(int index) {
    jawabanPersiapanGas[index] = !jawabanPersiapanGas[index];
    update();
  }

  var statusAman = true;

  var pengukurangas = 0;

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
    kodePermitTF = TextEditingController();
    namaPemohonTF = TextEditingController();
    bagianTF = TextEditingController();
    perusahaanTF = TextEditingController();
    lokasiTF = TextEditingController();
    tanggalKerjaTF = TextEditingController();
    nomorIjinTF = TextEditingController();
    jumlahPekerjaTF = TextEditingController();
    jamTF = TextEditingController();
    deskripsiTF = TextEditingController();
    namaProjectTF = TextEditingController();

    tanggalAwalSuratTF = TextEditingController();
    tanggalAkhirSuratTF = TextEditingController();
    jamAwalSuratTF = TextEditingController();
    jamAkhirSuratTF = TextEditingController();
    namaPengukurTF = TextEditingController();
    jamPengukurTF = TextEditingController();
    o2TF = TextEditingController();
    coTF = TextEditingController();
    h2sTF = TextEditingController();
    lelTF = TextEditingController();

    idjenispermit = arguments['idjenispermit'];
    getPertanyaan(arguments['idjenispermit']);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void selectTanggalTemuan(
    BuildContext context,
    TextEditingController param,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      param.text =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
  }

  void selectWaktu(BuildContext context, TextEditingController param) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      param.text =
          "${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}";
    }
  }

  void getPertanyaan(int idjenispermit) {
    print(idjenispermit);
    listPertanyaan.clear();
    try {
      permitProvider
          .getPertanyaan(idjenispermit)
          .then((value) {
            listPertanyaan.addAll(value.data!);
            initListHide();
            initListJawaban();
            print(jsonEncode(listPertanyaan));
            update();
          })
          .onError((error, _) {
            // print((e));
          });
    } catch (e) {
      // print(e);
    }
  }

  void initListHide() {
    var jmlSoalHeader = listPertanyaan.length;

    for (var i = 0; i < jmlSoalHeader; i++) {
      listHideSoal.add(false);
    }
  }

  void changeListHide(int index) {
    listHideSoal[index] = !listHideSoal[index];
    update();
  }

  void initListJawaban() {
    listjawaban.clear();

    for (var i = 0; i < listPertanyaan.length; i++) {
      var temp = [];

      bool isBahaya =
          listPertanyaan[i].jenispertanyaan?.toLowerCase().contains("bahaya") ??
          false;

      for (var j = 0; j < listPertanyaan[i].data!.length; j++) {
        if (isBahaya) {
          // untuk bahaya: simpan sebagai list of map (bisa tambah jam + aktual)
          temp.add([
            {"jam": "", "keterangan": ""},
          ]);
        } else {
          // normal: checkbox style
          temp.add({
            "idpertanyaan": listPertanyaan[i].data![j].idpertanyaan,
            "jawaban": false,
            "namapertanyaan": listPertanyaan[i].data![j].namapertanyaan,
          });
        }
      }

      listjawaban.add(temp);
    }
  }

  void changeListJawaban(int index, int indexSoal) {
    listjawaban[index][indexSoal]["jawaban"] =
        !listjawaban[index][indexSoal]["jawaban"];
    update();
  }

  void validasiHalamanPertama() {
    if (kodePermitTF.text == "") {
      DialogAlert.notif("Kode Permit Belum Diisi", "warning");
      return;
    }

    if (namaProjectTF.text == "") {
      DialogAlert.notif("Nama Project Belum Diisi", "warning");
      return;
    }

    if (tanggalKerjaTF.text == "") {
      DialogAlert.notif("Tanggal Belum Diisi", "warning");
      return;
    }

    if (jumlahPekerjaTF.text == "") {
      DialogAlert.notif("Jumah Pekerja Belum Diisi", "warning");
      return;
    }

    if (lokasiTF.text == "") {
      DialogAlert.notif("Lokasi Pekerjaan Belum Diisi", "warning");
      return;
    }

    if (deskripsiTF.text == "") {
      DialogAlert.notif("Deskripsi Pekerjaan Belum Diisi", "warning");
      return;
    }
  }

  void submitPermit() {
    var datajawaban = [];

    for (int i = 0; i < listjawaban.length; i++) {
      var group = listjawaban[i];
      var pertanyaan = listPertanyaan[i];

      for (int j = 0; j < group.length; j++) {
        var item = group[j];

        var idJenis = pertanyaan.data![j].idjenispertanyaan!;

        // 🔸 Tahap 2 (Bahaya): list of map {jam, keterangan}
        if (item is List) {
          for (var subitem in item) {
            if ((subitem["jam"]?.toString().isNotEmpty ?? false) ||
                (subitem["keterangan"]?.toString().isNotEmpty ?? false)) {
              datajawaban.add({
                "idjenispertanyaan": idJenis,
                "idpertanyaan": pertanyaan.data![j].idpertanyaan,
                "jam": subitem["jam"] ?? "",
                "keterangan": subitem["keterangan"] ?? "",
              });
            }
          }
        }
        // 🔸 Tahap 1 & 3: jawaban boolean
        else if (item is Map && item["jawaban"] == true) {
          datajawaban.add({
            "idjenispertanyaan": idJenis,
            "idpertanyaan": item["idpertanyaan"],
            "jawaban": 1,
            if (item.containsKey("namapertanyaan"))
              "namapertanyaan": item["namapertanyaan"],
          });
        }
      }
    }

    print(datajawaban);

    try {
      permitProvider
          .submitPermit(
            kodePermitTF.text,
            namaProjectTF.text,
            bagianTF.text,
            nomorIjinTF.text,
            tanggalKerjaTF.text,
            jamTF.text,
            int.parse(jumlahPekerjaTF.text),
            lokasiTF.text,
            deskripsiTF.text,
            idjenispermit,
            tanggalAwalSuratTF.text,
            jamAwalSuratTF.text,
            tanggalAkhirSuratTF.text,
            jamAkhirSuratTF.text,
            pekerjaanSesuaiProsedur.value ? 1 : 0,
            pekerjaanTelahDisampaikan.value ? 1 : 0,
            lokasiPastiAman.value ? 1 : 0,
            jsonEncode(datajawaban),
            imageFile.value!,
          )
          .then((value) {
            Get.back();
            Get.back();
            DialogAlert.notif(value, "success");
            permitListCtl.getListPermit(idjenispermit);
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

  void checkStatusAman() {
    if (o2TF.text != "" &&
        coTF.text != "" &&
        h2sTF.text != "" &&
        lelTF.text != "") {
      if (double.parse(o2TF.text) >= 19.5 &&
          double.parse(o2TF.text) <= 23.5 &&
          double.parse(coTF.text) < 25 &&
          double.parse((h2sTF.text)) < 1 &&
          double.parse(lelTF.text) < 10) {
        statusAman = true;
      } else {
        statusAman = false;
      }
    } else {
      statusAman = true;
    }

    update();
  }
}
