// To parse this JSON data, do
//
//     final listSbResponse = listSbResponseFromJson(jsonString);

import 'dart:convert';

ListSbResponse listSbResponseFromJson(String str) {
    final jsonData = json.decode(str);
    return ListSbResponse.fromJson(jsonData);
}

String listSbResponseToJson(ListSbResponse data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class ListSbResponse {
    bool success;
    String message;
    List<Sb> data;

    ListSbResponse({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ListSbResponse.fromJson(Map<String, dynamic> json) => new ListSbResponse(
        success: json["success"],
        message: json["message"],
        data: new List<Sb>.from(json["data"].map((x) => Sb.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Sb {
    int? idsafetybrief;
    String? tgltrans;
    String? shift;
    String? waktu;
    String? departemen;
    String? pemateri;
    int? jmlpekerja;
    String? namapekerja;
    String? namapekerjaan;
    String? pembahasan;
    String? dokumentasi;
    int? userentry;
    String? tglentry;
    String? status;
    String? userbuat;

    Sb({
        this.idsafetybrief,
        this.tgltrans,
        this.shift,
        this.waktu,
        this.departemen,
        this.pemateri,
        this.jmlpekerja,
        this.namapekerja,
        this.namapekerjaan,
        this.pembahasan,
        this.dokumentasi,
        this.userentry,
        this.tglentry,
        this.status,
        this.userbuat,
    });

    factory Sb.fromJson(Map<String, dynamic> json) => new Sb(
        idsafetybrief: json["idsafetybrief"],
        tgltrans: json["tgltrans"],
        shift: json["shift"],
        waktu: json["waktu"],
        departemen: json["departemen"],
        pemateri: json["pemateri"],
        jmlpekerja: json["jmlpekerja"],
        namapekerja: json["namapekerja"],
        namapekerjaan: json["namapekerjaan"],
        pembahasan: json["pembahasan"],
        dokumentasi: json["dokumentasi"],
        userentry: json["userentry"],
        tglentry: json["tglentry"],
        status: json["status"],
        userbuat: json["userbuat"],
    );

    Map<String, dynamic> toJson() => {
        "idsafetybrief": idsafetybrief,
        "tgltrans": tgltrans,
        "shift": shift,
        "waktu": waktu,
        "departemen": departemen,
        "pemateri": pemateri,
        "jmlpekerja": jmlpekerja,
        "namapekerja": namapekerja,
        "namapekerjaan": namapekerjaan,
        "pembahasan": pembahasan,
        "dokumentasi": dokumentasi,
        "userentry": userentry,
        "tglentry": tglentry,
        "status": status,
        "userbuat": userbuat,
    };
}
