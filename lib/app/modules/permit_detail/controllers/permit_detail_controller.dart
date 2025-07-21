import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/ListSoalPermitResponse.dart';
import 'package:hsse2/app/data/providers/permit_provider.dart';
import 'package:hsse2/app/modules/permit_list/controllers/permit_list_controller.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:hsse2/utils/helpers/helpers.dart';
import 'package:image_picker/image_picker.dart';

class PermitDetailController extends GetxController {
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

  var     idpermit         = 0;
  var     sudahapprove1    = 0;
  var     sudahapprove2    = 0;
  var     sudahapprove3    = 0;
  dynamic statuspenyelaian = 0;
  dynamic ttdpenyelesaian  = "";
  var     ttdapprove1      = "";
  var     ttdapprove2      = "";
  var     ttdapprove3      = "";
  var     ttdbuat          = "".obs;

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
    listPertanyaan.clear();
    try {
      permitProvider
          .getPertanyaan(idjenispermit)
          .then((value) {
            listPertanyaan.addAll(value.data!);
            initListHide();
            initListJawaban();
            update();

            getDetailPermit(arguments['idpermit']);
          })
          .onError((error, _) {});
    } catch (e) {}
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

  void getDetailPermit(int idpermit) {
    try {
      permitProvider
          .getDetailPermit(idpermit)
          .then((value) {
            kodePermitTF.text = value.data!.kodepermit ?? "";
            namaProjectTF.text = value.data!.namaproject ?? "";
            bagianTF.text = value.data!.bagian ?? "";
            perusahaanTF.text = value.data!.perusahaan ?? "";
            nomorIjinTF.text = value.data!.kodepermit ?? "";
            deskripsiTF.text = value.data!.deskripsi ?? "";
            lokasiTF.text = value.data!.lokasi ?? "";
            jumlahPekerjaTF.text = value.data!.jumlahpekerja.toString();
            tanggalKerjaTF.text = formatDate(value.data!.tgltrans.toString());
            jamTF.text = value.data!.jam.toString();
            tanggalAwalSuratTF.text = formatDate(
              value.data!.tglawalsurat.toString(),
            );
            tanggalAkhirSuratTF.text = formatDate(
              value.data!.tglakhirsurat.toString(),
            );
            jamAwalSuratTF.text = value.data!.jamawalsurat.toString();
            jamAkhirSuratTF.text = value.data!.jamakhirsurat.toString();

            var listJawabanTemp = value.data!.detailjawaban;

            idpermit = value.data!.idpermit ?? 0;
            sudahapprove1 = value.data!.sudahapprove1 ?? 0;
            sudahapprove2 = value.data!.sudahapprove2 ?? 0;
            sudahapprove3 = value.data!.sudahapprove3 ?? 0;

            ttdapprove1 = value.data!.ttdapprove1.toString();
            ttdapprove2 = value.data!.ttdapprove2.toString();
            ttdapprove3 = value.data!.ttdapprove3.toString();

            ttdbuat.value = value.data!.ttdbuat.toString();

            pekerjaanSesuaiProsedur.value =
                value.data!.pekerjaansesuai == 1 ? true : false;
            pekerjaanTelahDisampaikan.value =
                value.data!.pekerjaandisampaikan == 1 ? true : false;
            lokasiPastiAman.value = value.data!.lokasiaman == 1 ? true : false;

            statuspenyelaian = value.data!.statuspenyelesaian;
            ttdpenyelesaian = value.data!.ttdpenyelesaian;

            print(ttdpenyelesaian);

            // ✅ PERBAIKAN: Clear dulu listjawaban yang ada, lalu rebuild dengan data dari API
            listjawaban.clear();

            for (int i = 0; i < listPertanyaan.length; i++) {
              final pertanyaan = listPertanyaan[i];
              final jenis = pertanyaan.jenispertanyaan?.toLowerCase() ?? '';

              List<dynamic> subJawaban = [];

              for (int j = 0; j < pertanyaan.data!.length; j++) {
                final soal = pertanyaan.data![j];
                final id = soal.idpertanyaan;

                // Cari jawaban yang matching idpertanyaan
                final matched =
                    listJawabanTemp
                        ?.where((e) => e.idpertanyaan == id)
                        .toList();

                if (jenis.contains("bahaya")) {
                  /// =======================
                  /// Jika tipe pertanyaan adalah BAHAYA
                  /// =======================
                  List<Map<String, dynamic>> listBahaya = [];

                  if (matched != null && matched.isNotEmpty) {
                    listBahaya =
                        matched.map((e) {
                          return {
                            "jam": e.jam ?? "",
                            "jml": e.jml ?? "",
                            "keterangan": e.catatan ?? "",
                          };
                        }).toList();
                  }

                  // Default jika kosong
                  if (listBahaya.isEmpty) {
                    listBahaya = [
                      {"jam": "", "keterangan": ""},
                    ];
                  }

                  subJawaban.add(listBahaya);
                } else {
                  /// =======================
                  /// Jika tipe pertanyaan BUKAN bahaya
                  /// =======================
                  final isLainnya =
                      soal.namapertanyaan?.toLowerCase().contains("lainnya") ??
                      false;

                  if (matched != null && matched.isNotEmpty) {
                    final item = matched.first;

                    Map<String, dynamic> jawabanMap = {
                      "idpertanyaan": id,
                      "jawaban": item.jawaban == 1,
                    };

                    if (isLainnya) {
                      jawabanMap["namapertanyaan"] = item.catatan ?? "";
                    }

                    subJawaban.add(jawabanMap);
                  } else {
                    // Jawaban default jika tidak ada isian
                    subJawaban.add({"idpertanyaan": id, "jawaban": false});
                  }
                }
              }

              // ✅ PERBAIKAN: Add ke listjawaban instance controller, bukan variabel lokal
              listjawaban.add(subJawaban);
            }

            // ✅ PERBAIKAN: Debug print untuk memastikan data sudah benar
            // print("=== DEBUG LISTJAWABAN ===");
            // for (int i = 0; i < listjawaban.length; i++) {
            //   print("Section $i: ${listjawaban[i].length} items");
            //   for (int j = 0; j < listjawaban[i].length; j++) {
            //     print("  [$i][$j]: ${listjawaban[i][j]}");
            //   }
            // }
            // print("========================");

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
