// To parse this JSON data, do
//
//     final soalUnsafeResponse = soalUnsafeResponseFromJson(jsonString);

import 'dart:convert';

SoalUnsafeResponse soalUnsafeResponseFromJson(String str) =>
    SoalUnsafeResponse.fromJson(json.decode(str));

String soalUnsafeResponseToJson(SoalUnsafeResponse data) =>
    json.encode(data.toJson());

class SoalUnsafeResponse {
  bool? success;
  String? message;
  List<SoalUnsafe>? data;

  SoalUnsafeResponse({
    this.success,
    this.message,
    this.data,
  });

  SoalUnsafeResponse copyWith({
    bool? success,
    String? message,
    List<SoalUnsafe>? data,
  }) =>
      SoalUnsafeResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SoalUnsafeResponse.fromJson(Map<String, dynamic> json) =>
      SoalUnsafeResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SoalUnsafe>.from(
                json["data"]!.map((x) => SoalUnsafe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SoalUnsafe {
  int? idpertanyaanunsafe;
  String? namapertanyaanunsafe;
  int? idjenisunsafe;
  int? status;

  SoalUnsafe({
    this.idpertanyaanunsafe,
    this.namapertanyaanunsafe,
    this.idjenisunsafe,
    this.status,
  });

  SoalUnsafe copyWith({
    int? idpertanyaanunsafe,
    String? namapertanyaanunsafe,
    int? idjenisunsafe,
    int? status,
  }) =>
      SoalUnsafe(
        idpertanyaanunsafe: idpertanyaanunsafe ?? this.idpertanyaanunsafe,
        namapertanyaanunsafe: namapertanyaanunsafe ?? this.namapertanyaanunsafe,
        idjenisunsafe: idjenisunsafe ?? this.idjenisunsafe,
        status: status ?? this.status,
      );

  factory SoalUnsafe.fromJson(Map<String, dynamic> json) => SoalUnsafe(
        idpertanyaanunsafe: json["idpertanyaanunsafe"],
        namapertanyaanunsafe: json["namapertanyaanunsafe"],
        idjenisunsafe: json["idjenisunsafe"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "idpertanyaanunsafe": idpertanyaanunsafe,
        "namapertanyaanunsafe": namapertanyaanunsafe,
        "idjenisunsafe": idjenisunsafe,
        "status": status,
      };
}
