// To parse this JSON data, do
//
//     final listSoalPermit = listSoalPermitFromJson(jsonString);

import 'dart:convert';

ListSoalPermitResponse listSoalPermitFromJson(String str) => ListSoalPermitResponse.fromJson(json.decode(str));

String listSoalPermitToJson(ListSoalPermitResponse data) => json.encode(data.toJson());

class ListSoalPermitResponse {
    bool? success;
    String? message;
    List<ListSoalPermitData>? data;

    ListSoalPermitResponse({
        this.success,
        this.message,
        this.data,
    });

    ListSoalPermitResponse copyWith({
        bool? success,
        String? message,
        List<ListSoalPermitData>? data,
    }) => 
        ListSoalPermitResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory ListSoalPermitResponse.fromJson(Map<String, dynamic> json) => ListSoalPermitResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<ListSoalPermitData>.from(json["data"]!.map((x) => ListSoalPermitData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ListSoalPermitData {
    String? jenispertanyaan;
    List<SoalPermitItem>? data;

    ListSoalPermitData({
        this.jenispertanyaan,
        this.data,
    });

    ListSoalPermitData copyWith({
        String? jenispertanyaan,
        List<SoalPermitItem>? data,
    }) => 
        ListSoalPermitData(
            jenispertanyaan: jenispertanyaan ?? this.jenispertanyaan,
            data: data ?? this.data,
        );

    factory ListSoalPermitData.fromJson(Map<String, dynamic> json) => ListSoalPermitData(
        jenispertanyaan: json["jenispertanyaan"],
        data: json["data"] == null ? [] : List<SoalPermitItem>.from(json["data"]!.map((x) => SoalPermitItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "jenispertanyaan": jenispertanyaan,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class SoalPermitItem {
    int? idpertanyaan;
    String? namapertanyaan;
    int? idjenispertanyaan;
    int? idjenispermit;
    int? idgrup;
    int? status;
    String? namajenispermit;
    String? namajenispertanyaan;
    String? namagrup;

    SoalPermitItem({
        this.idpertanyaan,
        this.namapertanyaan,
        this.idjenispertanyaan,
        this.idjenispermit,
        this.idgrup,
        this.status,
        this.namajenispermit,
        this.namajenispertanyaan,
        this.namagrup,
    });

    SoalPermitItem copyWith({
        int? idpertanyaan,
        String? namapertanyaan,
        int? idjenispertanyaan,
        int? idjenispermit,
        int? idgrup,
        int? status,
        String? namajenispermit,
        String? namajenispertanyaan,
        String? namagrup,
    }) => 
        SoalPermitItem(
            idpertanyaan: idpertanyaan ?? this.idpertanyaan,
            namapertanyaan: namapertanyaan ?? this.namapertanyaan,
            idjenispertanyaan: idjenispertanyaan ?? this.idjenispertanyaan,
            idjenispermit: idjenispermit ?? this.idjenispermit,
            idgrup: idgrup ?? this.idgrup,
            status: status ?? this.status,
            namajenispermit: namajenispermit ?? this.namajenispermit,
            namajenispertanyaan: namajenispertanyaan ?? this.namajenispertanyaan,
            namagrup: namagrup ?? this.namagrup,
        );

    factory SoalPermitItem.fromJson(Map<String, dynamic> json) => SoalPermitItem(
        idpertanyaan: json["idpertanyaan"],
        namapertanyaan: json["namapertanyaan"],
        idjenispertanyaan: json["idjenispertanyaan"],
        idjenispermit: json["idjenispermit"],
        idgrup: json["idgrup"],
        status: json["status"],
        namajenispermit: json["namajenispermit"],
        namajenispertanyaan: json["namajenispertanyaan"],
        namagrup: json["namagrup"],
    );

    Map<String, dynamic> toJson() => {
        "idpertanyaan": idpertanyaan,
        "namapertanyaan": namapertanyaan,
        "idjenispertanyaan": idjenispertanyaan,
        "idjenispermit": idjenispermit,
        "idgrup": idgrup,
        "status": status,
        "namajenispermit": namajenispermit,
        "namajenispertanyaan": namajenispertanyaan,
        "namagrup": namagrup,
    };
}
