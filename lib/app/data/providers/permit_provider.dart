import 'dart:io';

import 'package:get/get.dart';
import 'package:hsse2/app/data/models/DetailPermitResponse.dart';
import 'package:hsse2/app/data/models/JenisPermitResponse.dart';
import 'package:hsse2/app/data/models/ListSoalPermitResponse.dart';
import 'package:hsse2/app/data/models/PermitResponse.dart';
import 'package:hsse2/app/data/providers/base_provider.dart';

class PermitProvider extends BaseProvider {
  Future<DetailPermitResponse> getDetailPermit(int idpermit) async {
    var response = await post('permit/detail', {"idpermit": idpermit});

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return detailPermitResponseFromJson(response.bodyString.toString());
    }
  }
  
  Future<PermitResponse> getListPermit(int idjenispermit) async {
    print("panggil");
    var form = {'idjenispermit': idjenispermit};
    var response = await post('permit/list', form);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return permitResponseFromJson(response.bodyString.toString());
    }
  }

  Future<ListSoalPermitResponse> getPertanyaan(int idJenisPermit) async {
    var form = {'idjenispermit': idJenisPermit};

    var response = await post('pertanyaan', form);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return listSoalPermitFromJson(response.bodyString.toString());
    }
  }

  Future<JenisPermitResponse> getJenispermit() async {
    var response = await get('jenispermit/list');

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return jenisPermitResponseFromJson(response.bodyString.toString());
    }
  }

  Future<String> submitPermit(
    String kodepermit,
    String namaproject,
    String bagian,
    String nomorijin,
    String tgltrans,
    String jam,
    int jumlahpekerja,
    String lokasi,
    String deskripsi,
    int idjenispermit,
    String tglawalsurat,
    String jamawalsurat,
    String tglakhirsurat,
    String jamakhirsurat,
    int pekerjaansesuai,
    int pekerjaandisampaikan,
    int lokasiaman,
    String datajawaban,
    File ttdbuat,
  ) async {
    print('test data');
    final form = FormData({
      "kodepermit": kodepermit,
      "namaproject": namaproject,
      "bagian": bagian,
      "nomorijin": nomorijin,
      "tgltrans": tgltrans,
      "jam": jam,
      "jumlahpekerja": jumlahpekerja,
      "lokasi": lokasi,
      "deskripsi": deskripsi,
      "idjenispermit": idjenispermit,
      "tglawalsurat": tglawalsurat,
      "jamawalsurat": jamawalsurat,
      "tglakhirsurat": tglakhirsurat,
      "jamakhirsurat": jamakhirsurat,
      "pekerjaansesuai": pekerjaansesuai,
      "pekerjaandisampaikan": pekerjaandisampaikan,
      "lokasiaman": lokasiaman,
      "datajawaban": datajawaban, // stringified json
      "ttdbuat": MultipartFile(ttdbuat, filename: ttdbuat.path.split('/').last),
    });

    var response = await post('permit/simpan', form);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body["message"];
    }
  }

  Future<String> checkAvailableApprove(int idpermit) async {
    var response = await post('permit/cekapprove', {"idpermit": idpermit});

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return "";
    }
  }

  Future<String> approvePermit(int idpermit, File ttdpermit) async {
    var form = FormData({
      "idpermit": idpermit,
      "ttd": MultipartFile(ttdpermit, filename: ttdpermit.path.split('/').last),
    });

    var response = await post('permit/approve', form);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body["message"];
    }
  }
}
