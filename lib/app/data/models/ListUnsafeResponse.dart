// To parse this JSON data, do
//
//     final listUnsafeResponse = listUnsafeResponseFromJson(jsonString);

import 'dart:convert';

ListUnsafeResponse listUnsafeResponseFromJson(String str) =>
    ListUnsafeResponse.fromJson(json.decode(str));

String listUnsafeResponseToJson(ListUnsafeResponse data) =>
    json.encode(data.toJson());

class ListUnsafeResponse {
  bool? success;
  String? message;
  List<ItemUnsafeList>? data;

  ListUnsafeResponse({
    this.success,
    this.message,
    this.data,
  });

  ListUnsafeResponse copyWith({
    bool? success,
    String? message,
    List<ItemUnsafeList>? data,
  }) =>
      ListUnsafeResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ListUnsafeResponse.fromJson(Map<String, dynamic> json) =>
      ListUnsafeResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ItemUnsafeList>.from(
                json["data"]!.map((x) => ItemUnsafeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ItemUnsafeList {
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
  String? username;
  String? namajenisunsafe;
  String? penanggungjawab;

  ItemUnsafeList({
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
    this.username,
    this.namajenisunsafe,
    this.penanggungjawab,
  });

  ItemUnsafeList copyWith({
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
    String? username,
    String? namajenisunsafe,
    String? penanggungjawab,
  }) =>
      ItemUnsafeList(
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
        username: username ?? this.username,
        namajenisunsafe: namajenisunsafe ?? this.namajenisunsafe,
        penanggungjawab: penanggungjawab ?? this.penanggungjawab,
      );

  factory ItemUnsafeList.fromJson(Map<String, dynamic> json) => ItemUnsafeList(
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
        username: json["username"],
        namajenisunsafe: json["namajenisunsafe"],
        penanggungjawab: json["penanggungjawab"],
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
        "username": username,
        "namajenisunsafe": namajenisunsafe,
        "penanggungjawab": penanggungjawab,
      };
}
