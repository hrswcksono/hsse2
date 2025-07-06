// To parse this JSON data, do
//
//     final jenisPermitResponse = jenisPermitResponseFromJson(jsonString);

import 'dart:convert';

JenisPermitResponse jenisPermitResponseFromJson(String str) =>
    JenisPermitResponse.fromJson(json.decode(str));

String jenisPermitResponseToJson(JenisPermitResponse data) =>
    json.encode(data.toJson());

class JenisPermitResponse {
  bool? success;
  String? message;
  List<JenisPermitItemResponse>? data;

  JenisPermitResponse({
    this.success,
    this.message,
    this.data,
  });

  JenisPermitResponse copyWith({
    bool? success,
    String? message,
    List<JenisPermitItemResponse>? data,
  }) =>
      JenisPermitResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory JenisPermitResponse.fromJson(Map<String, dynamic> json) =>
      JenisPermitResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<JenisPermitItemResponse>.from(
                json["data"]!.map((x) => JenisPermitItemResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class JenisPermitItemResponse {
  int? idjenispermit;
  String? namajenispermit;
  String? warna;
  dynamic icon;
  int? status;

  JenisPermitItemResponse({
    this.idjenispermit,
    this.namajenispermit,
    this.warna,
    this.icon,
    this.status,
  });

  JenisPermitItemResponse copyWith({
    int? idjenispermit,
    String? namajenispermit,
    String? warna,
    dynamic icon,
    int? status,
  }) =>
      JenisPermitItemResponse(
        idjenispermit: idjenispermit ?? this.idjenispermit,
        namajenispermit: namajenispermit ?? this.namajenispermit,
        warna: warna ?? this.warna,
        icon: icon ?? this.icon,
        status: status ?? this.status,
      );

  factory JenisPermitItemResponse.fromJson(Map<String, dynamic> json) =>
      JenisPermitItemResponse(
        idjenispermit: json["idjenispermit"],
        namajenispermit: json["namajenispermit"],
        warna: json["warna"],
        icon: json["icon"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "idjenispermit": idjenispermit,
        "namajenispermit": namajenispermit,
        "warna": warna,
        "icon": icon,
        "status": status,
      };
}
