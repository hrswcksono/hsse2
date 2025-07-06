// To parse this JSON data, do
//
//     final permitResponse = permitResponseFromJson(jsonString);

import 'dart:convert';

PermitResponse permitResponseFromJson(String str) => PermitResponse.fromJson(json.decode(str));

String permitResponseToJson(PermitResponse data) => json.encode(data.toJson());

class PermitResponse {
    bool? success;
    String? message;
    List<ListItemPermit>? data;

    PermitResponse({
        this.success,
        this.message,
        this.data,
    });

    factory PermitResponse.fromJson(Map<String, dynamic> json) => PermitResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<ListItemPermit>.from(json["data"]!.map((x) => ListItemPermit.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ListItemPermit {
    String? namajenispermit;
    int? idpermit;
    String? kodepermit;
    String? namaproject;
    int? idjenispermit;
    String? tgltrans;
    String? tglawalsurat;
    String? jamawalsurat;
    String? tglakhirsurat;
    String? jamakhirsurat;
    int? jumlahpekerja;
    String? lokasi;
    String? deskripsi;
    int? pengukurangas;
    int? userentry;
    String? tglentry;
    String? status;

    ListItemPermit({
        this.namajenispermit,
        this.idpermit,
        this.kodepermit,
        this.namaproject,
        this.idjenispermit,
        this.tgltrans,
        this.tglawalsurat,
        this.jamawalsurat,
        this.tglakhirsurat,
        this.jamakhirsurat,
        this.jumlahpekerja,
        this.lokasi,
        this.deskripsi,
        this.pengukurangas,
        this.userentry,
        this.tglentry,
        this.status,
    });

    factory ListItemPermit.fromJson(Map<String, dynamic> json) => ListItemPermit(
        namajenispermit: json["namajenispermit"],
        idpermit: json["idpermit"],
        kodepermit: json["kodepermit"],
        namaproject: json["namaproject"],
        idjenispermit: json["idjenispermit"],
        tgltrans: json["tgltrans"],
        tglawalsurat: json["tglawalsurat"],
        jamawalsurat: json["jamawalsurat"],
        tglakhirsurat: json["tglakhirsurat"],
        jamakhirsurat: json["jamakhirsurat"],
        jumlahpekerja: json["jumlahpekerja"],
        lokasi: json["lokasi"],
        deskripsi: json["deskripsi"],
        pengukurangas: json["pengukurangas"],
        userentry: json["userentry"],
        tglentry: json["tglentry"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "namajenispermit": namajenispermit,
        "idpermit": idpermit,
        "kodepermit": kodepermit,
        "namaproject": namaproject,
        "idjenispermit": idjenispermit,
        "tgltrans": tgltrans,
        "tglawalsurat": tglawalsurat,
        "jamawalsurat": jamawalsurat,
        "tglakhirsurat": tglakhirsurat,
        "jamakhirsurat": jamakhirsurat,
        "jumlahpekerja": jumlahpekerja,
        "lokasi": lokasi,
        "deskripsi": deskripsi,
        "pengukurangas": pengukurangas,
        "userentry": userentry,
        "tglentry": tglentry,
        "status": status,
    };
}
