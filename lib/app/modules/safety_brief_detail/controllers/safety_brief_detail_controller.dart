import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/CuacaResponse.dart';
import 'package:hsse2/app/data/providers/safety_brief_provider.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';

class SafetyBriefDetailController extends GetxController {

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

  void getCuaca() {
    listPertanyaan.clear();
    try {
      sbProvider
          .getCuaca()
          .then((value) {
            listPertanyaan.addAll(value.data!);
            // initJawaban();
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

  void getDetailSb(int idsafetybrief) {
    try {
      sbProvider
          .getDetailUnsafe(idsafetybrief)
          .then((value) {
            tglTF.text = value.data!.tgltrans.toString();
            waktuTF.text = value.data!.waktu.toString();
            shiftTF.text = value.data!.shift.toString();
            departemenTF.text = value.data!.departemen!.toString();
            jmlPekerjaTF.text = value.data!.jmlpekerja.toString();
            namaPekerjaTF.text = value.data!.namapekerja!;
            pekerjaanTF.text = value.data!.namapekerjaan!;
            pembahasanTF.text = value.data!.pembahasan!;

            var listJawabanTemp = value.data!.detailjawaban;

            for (var i = 0; i < listJawabanTemp!.length; i++) {
              listJawaban.add({
                'idpertanyaan': listJawabanTemp[i].idcuaca,
                'jawaban': true,
              });
            }

            imageFoto = value.data!.dokumentasi.toString();

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
