import 'dart:io';

import 'package:get/get.dart';
import 'package:hsse2/app/data/models/CuacaResponse.dart';
import 'package:hsse2/app/data/models/ListSbResponse.dart';
import 'package:hsse2/app/data/providers/base_provider.dart';

class SafetyBriefProvider extends BaseProvider {
  Future<Cuaca> getCuaca() async {
    var response = await post('sb/cuaca', {});

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return cuacaFromJson(response.bodyString.toString());
    }
  }

  Future<ListSbResponse> getListSB() async {
    var response = await post('sb/list', {});

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return listSbResponseFromJson(response.bodyString.toString());
    }
  }

  Future<String> submitSB(
    String tgltrans,
    String shift,
    String waktu,
    String departemen,
    String pemateri,
    String jmlpekerja,
    String namapekerja,
    String namapekerjaan,
    String pembahasan,
    String datajawaban,
    File dokumentasi,
  ) async {
    final formData = FormData({
      'tgltrans': tgltrans,
      'shift': shift,
      'waktu': waktu,
      'departemen': departemen,
      'pemateri': pemateri,
      'jmlpekerja': jmlpekerja,
      'namapekerja': namapekerja,
      'namapekerjaan': namapekerjaan,
      'pembahasan': pembahasan,
      'datajawaban': datajawaban,
      'dokumentasi': MultipartFile(
        dokumentasi,
        filename: dokumentasi.path.split('/').last,
      ),
    });

    var response = await post('sb/simpan', formData);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body["message"];
    }
  }
}
