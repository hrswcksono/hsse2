// To parse this JSON data, do
//
//     final notifikasiResponse = notifikasiResponseFromJson(jsonString);

import 'dart:convert';

NotifikasiResponse notifikasiResponseFromJson(String str) => NotifikasiResponse.fromJson(json.decode(str));

String notifikasiResponseToJson(NotifikasiResponse data) => json.encode(data.toJson());

class NotifikasiResponse {
    bool? success;
    String? message;
    List<NotifikasiItem>? data;

    NotifikasiResponse({
        this.success,
        this.message,
        this.data,
    });

    NotifikasiResponse copyWith({
        bool? success,
        String? message,
        List<NotifikasiItem>? data,
    }) => 
        NotifikasiResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory NotifikasiResponse.fromJson(Map<String, dynamic> json) => NotifikasiResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<NotifikasiItem>.from(json["data"]!.map((x) => NotifikasiItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class NotifikasiItem {
    int? id;
    int? idjenis;
    String? nama;
    String? userbuat;
    String? jenis;
    DateTime? tgltrans;
    String? tipe;
    String? kode;

    NotifikasiItem({
        this.id,
        this.idjenis,
        this.nama,
        this.userbuat,
        this.jenis,
        this.tgltrans,
        this.tipe,
        this.kode,
    });

    NotifikasiItem copyWith({
        int? id,
        int? idjenis,
        String? nama,
        String? userbuat,
        String? jenis,
        DateTime? tgltrans,
        String? tipe,
        String? kode,
    }) => 
        NotifikasiItem(
            id: id ?? this.id,
            idjenis: idjenis ?? this.idjenis,
            nama: nama ?? this.nama,
            userbuat: userbuat ?? this.userbuat,
            jenis: jenis ?? this.jenis,
            tgltrans: tgltrans ?? this.tgltrans,
            tipe: tipe ?? this.tipe,
            kode: kode ?? this.kode,
        );

    factory NotifikasiItem.fromJson(Map<String, dynamic> json) => NotifikasiItem(
        id: json["id"],
        idjenis: json["idjenis"],
        nama: json["nama"],
        userbuat: json["userbuat"],
        jenis: json["jenis"],
        tgltrans: json["tgltrans"] == null ? null : DateTime.parse(json["tgltrans"]),
        tipe: json["tipe"],
        kode: json["kode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idjenis": idjenis,
        "nama": nama,
        "userbuat": userbuat,
        "jenis": jenis,
        "tgltrans": "${tgltrans!.year.toString().padLeft(4, '0')}-${tgltrans!.month.toString().padLeft(2, '0')}-${tgltrans!.day.toString().padLeft(2, '0')}",
        "tipe": tipe,
        "kode": kode,
    };
}
