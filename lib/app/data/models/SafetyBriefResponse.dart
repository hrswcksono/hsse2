// To parse this JSON data, do
//
//     final safetyBriefResponse = safetyBriefResponseFromJson(jsonString);

import 'dart:convert';

SafetyBriefResponse safetyBriefResponseFromJson(String str) => SafetyBriefResponse.fromJson(json.decode(str));

String safetyBriefResponseToJson(SafetyBriefResponse data) => json.encode(data.toJson());

class SafetyBriefResponse {
    bool? success;
    String? message;
    SafetyBriefDetail? data;

    SafetyBriefResponse({
        this.success,
        this.message,
        this.data,
    });

    SafetyBriefResponse copyWith({
        bool? success,
        String? message,
        SafetyBriefDetail? data,
    }) => 
        SafetyBriefResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory SafetyBriefResponse.fromJson(Map<String, dynamic> json) => SafetyBriefResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : SafetyBriefDetail.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class SafetyBriefDetail {
    int? idsafetybrief;
    DateTime? tgltrans;
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
    DateTime? tglentry;
    String? status;
    List<Detailjawaban>? detailjawaban;

    SafetyBriefDetail({
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
        this.detailjawaban,
    });

    SafetyBriefDetail copyWith({
        int? idsafetybrief,
        DateTime? tgltrans,
        String? shift,
        String? waktu,
        String? departemen,
        String? pemateri,
        int? jmlpekerja,
        String? namapekerja,
        String? namapekerjaan,
        String? pembahasan,
        String? dokumentasi,
        int? userentry,
        DateTime? tglentry,
        String? status,
        List<Detailjawaban>? detailjawaban,
    }) => 
        SafetyBriefDetail(
            idsafetybrief: idsafetybrief ?? this.idsafetybrief,
            tgltrans: tgltrans ?? this.tgltrans,
            shift: shift ?? this.shift,
            waktu: waktu ?? this.waktu,
            departemen: departemen ?? this.departemen,
            pemateri: pemateri ?? this.pemateri,
            jmlpekerja: jmlpekerja ?? this.jmlpekerja,
            namapekerja: namapekerja ?? this.namapekerja,
            namapekerjaan: namapekerjaan ?? this.namapekerjaan,
            pembahasan: pembahasan ?? this.pembahasan,
            dokumentasi: dokumentasi ?? this.dokumentasi,
            userentry: userentry ?? this.userentry,
            tglentry: tglentry ?? this.tglentry,
            status: status ?? this.status,
            detailjawaban: detailjawaban ?? this.detailjawaban,
        );

    factory SafetyBriefDetail.fromJson(Map<String, dynamic> json) => SafetyBriefDetail(
        idsafetybrief: json["idsafetybrief"],
        tgltrans: json["tgltrans"] == null ? null : DateTime.parse(json["tgltrans"]),
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
        tglentry: json["tglentry"] == null ? null : DateTime.parse(json["tglentry"]),
        status: json["status"],
        detailjawaban: json["detailjawaban"] == null ? [] : List<Detailjawaban>.from(json["detailjawaban"]!.map((x) => Detailjawaban.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "idsafetybrief": idsafetybrief,
        "tgltrans": tgltrans?.toIso8601String(),
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
        "tglentry": tglentry?.toIso8601String(),
        "status": status,
        "detailjawaban": detailjawaban == null ? [] : List<dynamic>.from(detailjawaban!.map((x) => x.toJson())),
    };
}

class Detailjawaban {
    int? idsafetybrief;
    int? idcuaca;
    int? jawaban;

    Detailjawaban({
        this.idsafetybrief,
        this.idcuaca,
        this.jawaban,
    });

    Detailjawaban copyWith({
        int? idsafetybrief,
        int? idcuaca,
        int? jawaban,
    }) => 
        Detailjawaban(
            idsafetybrief: idsafetybrief ?? this.idsafetybrief,
            idcuaca: idcuaca ?? this.idcuaca,
            jawaban: jawaban ?? this.jawaban,
        );

    factory Detailjawaban.fromJson(Map<String, dynamic> json) => Detailjawaban(
        idsafetybrief: json["idsafetybrief"],
        idcuaca: json["idcuaca"],
        jawaban: json["jawaban"],
    );

    Map<String, dynamic> toJson() => {
        "idsafetybrief": idsafetybrief,
        "idcuaca": idcuaca,
        "jawaban": jawaban,
    };
}
