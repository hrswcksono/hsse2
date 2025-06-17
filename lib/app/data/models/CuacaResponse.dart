// To parse this JSON data, do
//
//     final cuaca = cuacaFromJson(jsonString);

import 'dart:convert';

Cuaca cuacaFromJson(String str) {
    final jsonData = json.decode(str);
    return Cuaca.fromJson(jsonData);
}

String cuacaToJson(Cuaca data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Cuaca {
    bool success;
    String message;
    List<CuacaItem> data;

    Cuaca({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Cuaca.fromJson(Map<String, dynamic> json) => new Cuaca(
        success: json["success"],
        message: json["message"],
        data: new List<CuacaItem>.from(json["data"].map((x) => CuacaItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CuacaItem {
    int? idcuaca;
    String? namacuaca;
    int? status;

    CuacaItem({
        this.idcuaca,
        this.namacuaca,
        this.status,
    });

    factory CuacaItem.fromJson(Map<String, dynamic> json) => new CuacaItem(
        idcuaca: json["idcuaca"],
        namacuaca: json["namacuaca"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "idcuaca": idcuaca,
        "namacuaca": namacuaca,
        "status": status,
    };
}
