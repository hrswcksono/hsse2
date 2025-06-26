// To parse this JSON data, do
//
//     final listUnsafeResponse = listUnsafeResponseFromJson(jsonString);

import 'dart:convert';

ListUnsafeResponse listUnsafeResponseFromJson(String str) => ListUnsafeResponse.fromJson(json.decode(str));

String listUnsafeResponseToJson(ListUnsafeResponse data) => json.encode(data.toJson());

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

    factory ListUnsafeResponse.fromJson(Map<String, dynamic> json) => ListUnsafeResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<ItemUnsafeList>.from(json["data"]!.map((x) => ItemUnsafeList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ItemUnsafeList {
    int? idunsafe;
    String? nama;
    DateTime? tgltemuan;
    String? waktu;
    String? lokasi;
    int? idjenisunsafe;
    String? pic;
    String? catatan;
    String? impac;
    String? rekomendasi;
    String? dokumentasi;
    int? konfirmasitemuan;
    int? idpenanggungjawab;
    String? statuspengerjaan;
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
        this.nama,
        this.tgltemuan,
        this.waktu,
        this.lokasi,
        this.idjenisunsafe,
        this.pic,
        this.catatan,
        this.impac,
        this.rekomendasi,
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
        String? nama,
        DateTime? tgltemuan,
        String? waktu,
        String? lokasi,
        int? idjenisunsafe,
        String? pic,
        String? catatan,
        String? impac,
        String? rekomendasi,
        String? dokumentasi,
        int? konfirmasitemuan,
        int? idpenanggungjawab,
        String? statuspengerjaan,
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
            nama: nama ?? this.nama,
            tgltemuan: tgltemuan ?? this.tgltemuan,
            waktu: waktu ?? this.waktu,
            lokasi: lokasi ?? this.lokasi,
            idjenisunsafe: idjenisunsafe ?? this.idjenisunsafe,
            pic: pic ?? this.pic,
            catatan: catatan ?? this.catatan,
            impac: impac ?? this.impac,
            rekomendasi: rekomendasi ?? this.rekomendasi,
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
        nama: json["nama"],
        tgltemuan: json["tgltemuan"] == null ? null : DateTime.parse(json["tgltemuan"]),
        waktu: json["waktu"],
        lokasi: json["lokasi"],
        idjenisunsafe: json["idjenisunsafe"],
        pic: json["pic"],
        catatan: json["catatan"],
        impac: json["impac"],
        rekomendasi: json["rekomendasi"],
        dokumentasi: json["dokumentasi"],
        konfirmasitemuan: json["konfirmasitemuan"],
        idpenanggungjawab: json["idpenanggungjawab"],
        statuspengerjaan: json["statuspengerjaan"],
        dokumentasitambahan: json["dokumentasitambahan"],
        catatantambahan: json["catatantambahan"],
        tglrespon: json["tglrespon"] == null ? null : DateTime.parse(json["tglrespon"]),
        userentry: json["userentry"],
        tglentry: json["tglentry"] == null ? null : DateTime.parse(json["tglentry"]),
        status: json["status"],
        username: json["username"],
        namajenisunsafe: json["namajenisunsafe"],
        penanggungjawab: json["penanggungjawab"],
    );

    Map<String, dynamic> toJson() => {
        "idunsafe": idunsafe,
        "nama": nama,
        "tgltemuan": tgltemuan?.toIso8601String(),
        "waktu": waktu,
        "lokasi": lokasi,
        "idjenisunsafe": idjenisunsafe,
        "pic": pic,
        "catatan": catatan,
        "impac": impac,
        "rekomendasi": rekomendasi,
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
