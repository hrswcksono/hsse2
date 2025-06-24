import 'dart:io';

import 'package:get/get.dart';
import 'package:hsse2/app/data/models/DetailUnsafeResponse.dart';
import 'package:hsse2/app/data/models/ListUnsafeResponse.dart';
import 'package:hsse2/app/data/providers/base_provider.dart';

import '../models/SoalUnsafeRepsonse.dart';

class UnsafeProvider extends BaseProvider {
  Future<SoalUnsafeResponse> getSoalUnsafe(int idjenisunsafe) async {
    print({
      'idjenisunsafe' : idjenisunsafe
    });
    var response = await post('unsafe/soal', {'idjenisunsafe': idjenisunsafe});

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return soalUnsafeResponseFromJson(response.bodyString.toString());
    }
  }

  Future<ListUnsafeResponse> listSoalUnsafe(int idjenisunsafe) async {
    print({
      'idjenisunsafe' : idjenisunsafe
    });

    var response = await post('unsafe/list', {
      'idjenisunsafe' : idjenisunsafe
    });

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return listUnsafeResponseFromJson(response.bodyString.toString());
    }
  }

  Future<ListUnsafeResponse> listSoalUnsafeApproval() async {
    var response = await post('unsafe/listapproval', {});

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return listUnsafeResponseFromJson(response.bodyString.toString());
    }
  }

  Future<DetailUnsafeResponse> getDetailUnsafe(int idunsafe) async {
    var response = await post('unsafe/detail', {'idunsafe': idunsafe});

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return detailUnsafeResponseFromJson(response.bodyString.toString());
    }
  }

  Future<String> submitUnsafe(
    int idJenisUsafe,
    String nama,
    String tgltemuan,
    String waktu,
    String lokasi,
    String pic,
    String datajawaban,
    String catatan,
    String impac,
    String rekomendasi,
    File dokumentasi,
  ) async {
    final formData = FormData({
      'idjenisunsafe': idJenisUsafe,
      'nama': nama,
      'tgltemuan': tgltemuan,
      'waktu': waktu,
      'lokasi': lokasi,
      'pic': pic,
      'catatan': catatan,
      'impac': impac,
      'rekomendasi': rekomendasi,
      'datajawaban': datajawaban,
      'dokumentasi': MultipartFile(
        dokumentasi,
        filename: dokumentasi.path.split('/').last,
      ),
    });

    var response = await post('unsafe/simpan', formData);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body["message"];
    }
  }

  Future<String> responseUnsafe(
    int idunsafe,
    String konfirmasitemuan,
    String statuspengerjaan,
    String catatantambahan,
    File dokumentasi,
  ) async {
    final formData = FormData({
      'idunsafe': idunsafe,
      'konfirmasitemuan': konfirmasitemuan,
      'statuspengerjaan': statuspengerjaan,
      'catatantambahan': catatantambahan,
      'dokumentasi': MultipartFile(
        dokumentasi,
        filename: dokumentasi.path.split('/').last,
      ),
    });

    var response = await post('unsafe/respon', formData);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body["message"];
    }
  }
}
