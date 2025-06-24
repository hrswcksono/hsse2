// To parse this JSON data, do
//
//     final detailUnsafeResponse = detailUnsafeResponseFromJson(jsonString);

import 'dart:convert';

DetailUnsafeResponse detailUnsafeResponseFromJson(String str) {
    final jsonData = json.decode(str);
    return DetailUnsafeResponse.fromJson(jsonData);
}

String detailUnsafeResponseToJson(DetailUnsafeResponse data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class DetailUnsafeResponse {
    bool success;
    String message;
    DetailUnsafe? data;

    DetailUnsafeResponse({
        required this.success,
        required this.message,
        required this.data,
    });

    factory DetailUnsafeResponse.fromJson(Map<String, dynamic> json) => new DetailUnsafeResponse(
        success: json["success"],
        message: json["message"],
        data: DetailUnsafe.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
    };
}

class DetailUnsafe {
    int? idunsafe;
    String? nama;
    String? tgltemuan;
    String? waktu;
    String? lokasi;
    int? idjenisunsafe;
    String? pic;
    String? catatan;
    String? impac;
    String? rekomendasi;
    String? dokumentasi;
    dynamic konfirmasitemuan;
    dynamic idpenanggungjawab;
    dynamic statuspengerjaan;
    String? dokumentasitambahan;
    dynamic catatantambahan;
    dynamic tglrespon;
    int? userentry;
    String? tglentry;
    String? status;
    String? pembuat;
    String? namajenisunsafe;
    dynamic penanggungjawab;
    List<Detail> detail;

    DetailUnsafe({
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
        this.pembuat,
        this.namajenisunsafe,
        this.penanggungjawab,
        required this.detail,
    });

    factory DetailUnsafe.fromJson(Map<String, dynamic> json) => new DetailUnsafe(
        idunsafe: json["idunsafe"],
        nama: json["nama"],
        tgltemuan: json["tgltemuan"],
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
        tglrespon: json["tglrespon"],
        userentry: json["userentry"],
        tglentry: json["tglentry"],
        status: json["status"],
        pembuat: json["pembuat"],
        namajenisunsafe: json["namajenisunsafe"],
        penanggungjawab: json["penanggungjawab"],
        detail: new List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "idunsafe": idunsafe,
        "nama": nama,
        "tgltemuan": tgltemuan,
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
        "tglrespon": tglrespon,
        "userentry": userentry,
        "tglentry": tglentry,
        "status": status,
        "pembuat": pembuat,
        "namajenisunsafe": namajenisunsafe,
        "penanggungjawab": penanggungjawab,
        "detail": new List<dynamic>.from(detail.map((x) => x.toJson())),
    };
}

class Detail {
    int? idunsafedtl;
    int? idunsafe;
    int? idpertanyaanunsafe;
    int? jawaban;
    int? userentry;
    String? tglentry;
    String? status;

    Detail({
        this.idunsafedtl,
        this.idunsafe,
        this.idpertanyaanunsafe,
        this.jawaban,
        this.userentry,
        this.tglentry,
        this.status,
    });

    factory Detail.fromJson(Map<String, dynamic> json) => new Detail(
        idunsafedtl: json["idunsafedtl"],
        idunsafe: json["idunsafe"],
        idpertanyaanunsafe: json["idpertanyaanunsafe"],
        jawaban: json["jawaban"],
        userentry: json["userentry"],
        tglentry: json["tglentry"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "idunsafedtl": idunsafedtl,
        "idunsafe": idunsafe,
        "idpertanyaanunsafe": idpertanyaanunsafe,
        "jawaban": jawaban,
        "userentry": userentry,
        "tglentry": tglentry,
        "status": status,
    };
}
