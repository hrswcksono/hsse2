// To parse this JSON data, do
//
//     final listSafetyBrief = listSafetyBriefFromJson(jsonString);

import 'dart:convert';

ListSafetyBrief listSafetyBriefFromJson(String str) {
    final jsonData = json.decode(str);
    return ListSafetyBrief.fromJson(jsonData);
}

String listSafetyBriefToJson(ListSafetyBrief data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class ListSafetyBrief {
    bool success;
    String message;
    List<SafetyBriefItem> data;

    ListSafetyBrief({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ListSafetyBrief.fromJson(Map<String, dynamic> json) => new ListSafetyBrief(
        success: json["success"],
        message: json["message"],
        data: new List<SafetyBriefItem>.from(json["data"].map((x) => SafetyBriefItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class SafetyBriefItem {
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

    SafetyBriefItem({
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

    factory SafetyBriefItem.fromJson(Map<String, dynamic> json) => new SafetyBriefItem(
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
