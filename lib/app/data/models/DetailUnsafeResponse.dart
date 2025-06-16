// To parse this JSON data, do
//
//     final detailUnsafeResponse = detailUnsafeResponseFromJson(jsonString);

import 'dart:convert';

DetailUnsafeResponse detailUnsafeResponseFromJson(String str) =>
    DetailUnsafeResponse.fromJson(json.decode(str));

String detailUnsafeResponseToJson(DetailUnsafeResponse data) =>
    json.encode(data.toJson());

class DetailUnsafeResponse {
  bool? success;
  String? message;
  DetailUnsafe? data;

  DetailUnsafeResponse({
    this.success,
    this.message,
    this.data,
  });

  DetailUnsafeResponse copyWith({
    bool? success,
    String? message,
    DetailUnsafe? data,
  }) =>
      DetailUnsafeResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory DetailUnsafeResponse.fromJson(Map<String, dynamic> json) =>
      DetailUnsafeResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : DetailUnsafe.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class DetailUnsafe {
  int? idunsafe;
  DateTime? tgltemuan;
  String? lokasi;
  int? idjenisunsafe;
  String? catatan;
  String? dokumentasi;
  int? konfirmasitemuan;
  int? idpenanggungjawab;
  int? statuspengerjaan;
  String? dokumentasitambahan;
  String? catatantambahan;
  DateTime? tglrespon;
  int? userentry;
  DateTime? tglentry;
  String? status;
  String? pembuat;
  String? namajenisunsafe;
  String? penanggungjawab;
  List<DetailUnsafeJawaban>? detail;

  DetailUnsafe({
    this.idunsafe,
    this.tgltemuan,
    this.lokasi,
    this.idjenisunsafe,
    this.catatan,
    this.dokumentasi,
    this.konfirmasitemuan,
    this.idpenanggungjawab,
    this.statuspengerjaan,
    this.dokumentasitambahan,
    this.catatantambahan,
    this.tglrespon,
    this.userentry,
    this.tglentry,
    this.status,
    this.pembuat,
    this.namajenisunsafe,
    this.penanggungjawab,
    this.detail,
  });

  DetailUnsafe copyWith({
    int? idunsafe,
    DateTime? tgltemuan,
    String? lokasi,
    int? idjenisunsafe,
    String? catatan,
    String? dokumentasi,
    int? konfirmasitemuan,
    int? idpenanggungjawab,
    int? statuspengerjaan,
    String? dokumentasitambahan,
    String? catatantambahan,
    DateTime? tglrespon,
    int? userentry,
    DateTime? tglentry,
    String? status,
    String? pembuat,
    String? namajenisunsafe,
    String? penanggungjawab,
    List<DetailUnsafeJawaban>? detail,
  }) =>
      DetailUnsafe(
        idunsafe: idunsafe ?? this.idunsafe,
        tgltemuan: tgltemuan ?? this.tgltemuan,
        lokasi: lokasi ?? this.lokasi,
        idjenisunsafe: idjenisunsafe ?? this.idjenisunsafe,
        catatan: catatan ?? this.catatan,
        dokumentasi: dokumentasi ?? this.dokumentasi,
        konfirmasitemuan: konfirmasitemuan ?? this.konfirmasitemuan,
        idpenanggungjawab: idpenanggungjawab ?? this.idpenanggungjawab,
        statuspengerjaan: statuspengerjaan ?? this.statuspengerjaan,
        dokumentasitambahan: dokumentasitambahan ?? this.dokumentasitambahan,
        catatantambahan: catatantambahan ?? this.catatantambahan,
        tglrespon: tglrespon ?? this.tglrespon,
        userentry: userentry ?? this.userentry,
        tglentry: tglentry ?? this.tglentry,
        status: status ?? this.status,
        pembuat: pembuat ?? this.pembuat,
        namajenisunsafe: namajenisunsafe ?? this.namajenisunsafe,
        penanggungjawab: penanggungjawab ?? this.penanggungjawab,
        detail: detail ?? this.detail,
      );

  factory DetailUnsafe.fromJson(Map<String, dynamic> json) => DetailUnsafe(
        idunsafe: json["idunsafe"],
        tgltemuan: json["tgltemuan"] == null
            ? null
            : DateTime.parse(json["tgltemuan"]),
        lokasi: json["lokasi"],
        idjenisunsafe: json["idjenisunsafe"],
        catatan: json["catatan"],
        dokumentasi: json["dokumentasi"],
        konfirmasitemuan: json["konfirmasitemuan"],
        idpenanggungjawab: json["idpenanggungjawab"],
        statuspengerjaan: json["statuspengerjaan"],
        dokumentasitambahan: json["dokumentasitambahan"],
        catatantambahan: json["catatantambahan"],
        tglrespon: json["tglrespon"] == null
            ? null
            : DateTime.parse(json["tglrespon"]),
        userentry: json["userentry"],
        tglentry:
            json["tglentry"] == null ? null : DateTime.parse(json["tglentry"]),
        status: json["status"],
        pembuat: json["pembuat"],
        namajenisunsafe: json["namajenisunsafe"],
        penanggungjawab: json["penanggungjawab"],
        detail: json["detail"] == null
            ? []
            : List<DetailUnsafeJawaban>.from(
                json["detail"]!.map((x) => DetailUnsafeJawaban.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idunsafe": idunsafe,
        "tgltemuan":
            "${tgltemuan!.year.toString().padLeft(4, '0')}-${tgltemuan!.month.toString().padLeft(2, '0')}-${tgltemuan!.day.toString().padLeft(2, '0')}",
        "lokasi": lokasi,
        "idjenisunsafe": idjenisunsafe,
        "catatan": catatan,
        "dokumentasi": dokumentasi,
        "konfirmasitemuan": konfirmasitemuan,
        "idpenanggungjawab": idpenanggungjawab,
        "statuspengerjaan": statuspengerjaan,
        "dokumentasitambahan": dokumentasitambahan,
        "catatantambahan": catatantambahan,
        "tglrespon": tglrespon?.toIso8601String(),
        "userentry": userentry,
        "tglentry": tglentry?.toIso8601String(),
        "status": status,
        "pembuat": pembuat,
        "namajenisunsafe": namajenisunsafe,
        "penanggungjawab": penanggungjawab,
        "detail": detail == null
            ? []
            : List<dynamic>.from(detail!.map((x) => x.toJson())),
      };
}

class DetailUnsafeJawaban {
  int? idunsafedtl;
  int? idunsafe;
  int? idpertanyaanunsafe;
  int? jawaban;
  int? userentry;
  DateTime? tglentry;
  String? status;

  DetailUnsafeJawaban({
    this.idunsafedtl,
    this.idunsafe,
    this.idpertanyaanunsafe,
    this.jawaban,
    this.userentry,
    this.tglentry,
    this.status,
  });

  DetailUnsafeJawaban copyWith({
    int? idunsafedtl,
    int? idunsafe,
    int? idpertanyaanunsafe,
    int? jawaban,
    int? userentry,
    DateTime? tglentry,
    String? status,
  }) =>
      DetailUnsafeJawaban(
        idunsafedtl: idunsafedtl ?? this.idunsafedtl,
        idunsafe: idunsafe ?? this.idunsafe,
        idpertanyaanunsafe: idpertanyaanunsafe ?? this.idpertanyaanunsafe,
        jawaban: jawaban ?? this.jawaban,
        userentry: userentry ?? this.userentry,
        tglentry: tglentry ?? this.tglentry,
        status: status ?? this.status,
      );

  factory DetailUnsafeJawaban.fromJson(Map<String, dynamic> json) =>
      DetailUnsafeJawaban(
        idunsafedtl: json["idunsafedtl"],
        idunsafe: json["idunsafe"],
        idpertanyaanunsafe: json["idpertanyaanunsafe"],
        jawaban: json["jawaban"],
        userentry: json["userentry"],
        tglentry:
            json["tglentry"] == null ? null : DateTime.parse(json["tglentry"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "idunsafedtl": idunsafedtl,
        "idunsafe": idunsafe,
        "idpertanyaanunsafe": idpertanyaanunsafe,
        "jawaban": jawaban,
        "userentry": userentry,
        "tglentry": tglentry?.toIso8601String(),
        "status": status,
      };
}
