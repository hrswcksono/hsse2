// To parse this JSON data, do
//
//     final detailPermitResponse = detailPermitResponseFromJson(jsonString);

import 'dart:convert';

DetailPermitResponse detailPermitResponseFromJson(String str) => DetailPermitResponse.fromJson(json.decode(str));

String detailPermitResponseToJson(DetailPermitResponse data) => json.encode(data.toJson());

class DetailPermitResponse {
    bool? success;
    String? message;
    Data? data;

    DetailPermitResponse({
        this.success,
        this.message,
        this.data,
    });

    DetailPermitResponse copyWith({
        bool? success,
        String? message,
        Data? data,
    }) => 
        DetailPermitResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory DetailPermitResponse.fromJson(Map<String, dynamic> json) => DetailPermitResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    String? namajenispermit;
    int? idpermit;
    String? kodepermit;
    String? namaproject;
    String? bagian;
    String? nomorijin;
    dynamic lainnyajenispekerjaan;
    int? pekerjaansesuai;
    int? pekerjaandisampaikan;
    int? lokasiaman;
    String? ttdbuat;
    int? idjenispermit;
    DateTime? tgltrans;
    String? jam;
    DateTime? tglawalsurat;
    String? jamawalsurat;
    DateTime? tglakhirsurat;
    String? jamakhirsurat;
    int? jumlahpekerja;
    String? lokasi;
    String? deskripsi;
    int? userentry;
    DateTime? tglentry;
    dynamic userubahstatus;
    dynamic tglubahstatus;
    dynamic jamubahstatus;
    dynamic ttdpenyelesaian;
    dynamic statuspenyelesaian;
    String? status;
    String? userbuat;
    List<Detailjawaban>? detailjawaban;
    List<Detailapproval>? detailapproval;

    Data({
        this.namajenispermit,
        this.idpermit,
        this.kodepermit,
        this.namaproject,
        this.bagian,
        this.nomorijin,
        this.lainnyajenispekerjaan,
        this.pekerjaansesuai,
        this.pekerjaandisampaikan,
        this.lokasiaman,
        this.ttdbuat,
        this.idjenispermit,
        this.tgltrans,
        this.jam,
        this.tglawalsurat,
        this.jamawalsurat,
        this.tglakhirsurat,
        this.jamakhirsurat,
        this.jumlahpekerja,
        this.lokasi,
        this.deskripsi,
        this.userentry,
        this.tglentry,
        this.userubahstatus,
        this.tglubahstatus,
        this.jamubahstatus,
        this.ttdpenyelesaian,
        this.statuspenyelesaian,
        this.status,
        this.userbuat,
        this.detailjawaban,
        this.detailapproval,
    });

    Data copyWith({
        String? namajenispermit,
        int? idpermit,
        String? kodepermit,
        String? namaproject,
        String? bagian,
        String? nomorijin,
        dynamic lainnyajenispekerjaan,
        int? pekerjaansesuai,
        int? pekerjaandisampaikan,
        int? lokasiaman,
        String? ttdbuat,
        int? idjenispermit,
        DateTime? tgltrans,
        String? jam,
        DateTime? tglawalsurat,
        String? jamawalsurat,
        DateTime? tglakhirsurat,
        String? jamakhirsurat,
        int? jumlahpekerja,
        String? lokasi,
        String? deskripsi,
        int? userentry,
        DateTime? tglentry,
        dynamic userubahstatus,
        dynamic tglubahstatus,
        dynamic jamubahstatus,
        dynamic ttdpenyelesaian,
        dynamic statuspenyelesaian,
        String? status,
        String? userbuat,
        List<Detailjawaban>? detailjawaban,
        List<Detailapproval>? detailapproval,
    }) => 
        Data(
            namajenispermit: namajenispermit ?? this.namajenispermit,
            idpermit: idpermit ?? this.idpermit,
            kodepermit: kodepermit ?? this.kodepermit,
            namaproject: namaproject ?? this.namaproject,
            bagian: bagian ?? this.bagian,
            nomorijin: nomorijin ?? this.nomorijin,
            lainnyajenispekerjaan: lainnyajenispekerjaan ?? this.lainnyajenispekerjaan,
            pekerjaansesuai: pekerjaansesuai ?? this.pekerjaansesuai,
            pekerjaandisampaikan: pekerjaandisampaikan ?? this.pekerjaandisampaikan,
            lokasiaman: lokasiaman ?? this.lokasiaman,
            ttdbuat: ttdbuat ?? this.ttdbuat,
            idjenispermit: idjenispermit ?? this.idjenispermit,
            tgltrans: tgltrans ?? this.tgltrans,
            jam: jam ?? this.jam,
            tglawalsurat: tglawalsurat ?? this.tglawalsurat,
            jamawalsurat: jamawalsurat ?? this.jamawalsurat,
            tglakhirsurat: tglakhirsurat ?? this.tglakhirsurat,
            jamakhirsurat: jamakhirsurat ?? this.jamakhirsurat,
            jumlahpekerja: jumlahpekerja ?? this.jumlahpekerja,
            lokasi: lokasi ?? this.lokasi,
            deskripsi: deskripsi ?? this.deskripsi,
            userentry: userentry ?? this.userentry,
            tglentry: tglentry ?? this.tglentry,
            userubahstatus: userubahstatus ?? this.userubahstatus,
            tglubahstatus: tglubahstatus ?? this.tglubahstatus,
            jamubahstatus: jamubahstatus ?? this.jamubahstatus,
            ttdpenyelesaian: ttdpenyelesaian ?? this.ttdpenyelesaian,
            statuspenyelesaian: statuspenyelesaian ?? this.statuspenyelesaian,
            status: status ?? this.status,
            userbuat: userbuat ?? this.userbuat,
            detailjawaban: detailjawaban ?? this.detailjawaban,
            detailapproval: detailapproval ?? this.detailapproval,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        namajenispermit: json["namajenispermit"],
        idpermit: json["idpermit"],
        kodepermit: json["kodepermit"],
        namaproject: json["namaproject"],
        bagian: json["bagian"],
        nomorijin: json["nomorijin"],
        lainnyajenispekerjaan: json["lainnyajenispekerjaan"],
        pekerjaansesuai: json["pekerjaansesuai"],
        pekerjaandisampaikan: json["pekerjaandisampaikan"],
        lokasiaman: json["lokasiaman"],
        ttdbuat: json["ttdbuat"],
        idjenispermit: json["idjenispermit"],
        tgltrans: json["tgltrans"] == null ? null : DateTime.parse(json["tgltrans"]),
        jam: json["jam"],
        tglawalsurat: json["tglawalsurat"] == null ? null : DateTime.parse(json["tglawalsurat"]),
        jamawalsurat: json["jamawalsurat"],
        tglakhirsurat: json["tglakhirsurat"] == null ? null : DateTime.parse(json["tglakhirsurat"]),
        jamakhirsurat: json["jamakhirsurat"],
        jumlahpekerja: json["jumlahpekerja"],
        lokasi: json["lokasi"],
        deskripsi: json["deskripsi"],
        userentry: json["userentry"],
        tglentry: json["tglentry"] == null ? null : DateTime.parse(json["tglentry"]),
        userubahstatus: json["userubahstatus"],
        tglubahstatus: json["tglubahstatus"],
        jamubahstatus: json["jamubahstatus"],
        ttdpenyelesaian: json["ttdpenyelesaian"],
        statuspenyelesaian: json["statuspenyelesaian"],
        status: json["status"],
        userbuat: json["userbuat"],
        detailjawaban: json["detailjawaban"] == null ? [] : List<Detailjawaban>.from(json["detailjawaban"]!.map((x) => Detailjawaban.fromJson(x))),
        detailapproval: json["detailapproval"] == null ? [] : List<Detailapproval>.from(json["detailapproval"]!.map((x) => Detailapproval.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "namajenispermit": namajenispermit,
        "idpermit": idpermit,
        "kodepermit": kodepermit,
        "namaproject": namaproject,
        "bagian": bagian,
        "nomorijin": nomorijin,
        "lainnyajenispekerjaan": lainnyajenispekerjaan,
        "pekerjaansesuai": pekerjaansesuai,
        "pekerjaandisampaikan": pekerjaandisampaikan,
        "lokasiaman": lokasiaman,
        "ttdbuat": ttdbuat,
        "idjenispermit": idjenispermit,
        "tgltrans": tgltrans?.toIso8601String(),
        "jam": jam,
        "tglawalsurat": tglawalsurat?.toIso8601String(),
        "jamawalsurat": jamawalsurat,
        "tglakhirsurat": tglakhirsurat?.toIso8601String(),
        "jamakhirsurat": jamakhirsurat,
        "jumlahpekerja": jumlahpekerja,
        "lokasi": lokasi,
        "deskripsi": deskripsi,
        "userentry": userentry,
        "tglentry": tglentry?.toIso8601String(),
        "userubahstatus": userubahstatus,
        "tglubahstatus": tglubahstatus,
        "jamubahstatus": jamubahstatus,
        "ttdpenyelesaian": ttdpenyelesaian,
        "statuspenyelesaian": statuspenyelesaian,
        "status": status,
        "userbuat": userbuat,
        "detailjawaban": detailjawaban == null ? [] : List<dynamic>.from(detailjawaban!.map((x) => x.toJson())),
        "detailapproval": detailapproval == null ? [] : List<dynamic>.from(detailapproval!.map((x) => x.toJson())),
    };
}

class Detailapproval {
    int? idpermitapprove;
    int? idpermit;
    dynamic iduser;
    int? idrole;
    dynamic tglapprove;
    DateTime? tglubahstatus;
    dynamic ttd;
    int? urutan;
    int? status;
    dynamic username;
    String? namarole;

    Detailapproval({
        this.idpermitapprove,
        this.idpermit,
        this.iduser,
        this.idrole,
        this.tglapprove,
        this.tglubahstatus,
        this.ttd,
        this.urutan,
        this.status,
        this.username,
        this.namarole,
    });

    Detailapproval copyWith({
        int? idpermitapprove,
        int? idpermit,
        dynamic iduser,
        int? idrole,
        dynamic tglapprove,
        DateTime? tglubahstatus,
        dynamic ttd,
        int? urutan,
        int? status,
        dynamic username,
        String? namarole,
    }) => 
        Detailapproval(
            idpermitapprove: idpermitapprove ?? this.idpermitapprove,
            idpermit: idpermit ?? this.idpermit,
            iduser: iduser ?? this.iduser,
            idrole: idrole ?? this.idrole,
            tglapprove: tglapprove ?? this.tglapprove,
            tglubahstatus: tglubahstatus ?? this.tglubahstatus,
            ttd: ttd ?? this.ttd,
            urutan: urutan ?? this.urutan,
            status: status ?? this.status,
            username: username ?? this.username,
            namarole: namarole ?? this.namarole,
        );

    factory Detailapproval.fromJson(Map<String, dynamic> json) => Detailapproval(
        idpermitapprove: json["idpermitapprove"],
        idpermit: json["idpermit"],
        iduser: json["iduser"],
        idrole: json["idrole"],
        tglapprove: json["tglapprove"],
        tglubahstatus: json["tglubahstatus"] == null ? null : DateTime.parse(json["tglubahstatus"]),
        ttd: json["ttd"],
        urutan: json["urutan"],
        status: json["status"],
        username: json["username"],
        namarole: json["namarole"],
    );

    Map<String, dynamic> toJson() => {
        "idpermitapprove": idpermitapprove,
        "idpermit": idpermit,
        "iduser": iduser,
        "idrole": idrole,
        "tglapprove": tglapprove,
        "tglubahstatus": tglubahstatus?.toIso8601String(),
        "ttd": ttd,
        "urutan": urutan,
        "status": status,
        "username": username,
        "namarole": namarole,
    };
}

class Detailjawaban {
    int? idpermitdtl;
    int? idpermit;
    int? idpertanyaan;
    int? jawaban;
    String? jam;
    int? jml;
    String? catatan;
    int? userentry;
    DateTime? tglentry;
    String? status;

    Detailjawaban({
        this.idpermitdtl,
        this.idpermit,
        this.idpertanyaan,
        this.jawaban,
        this.jam,
        this.jml,
        this.catatan,
        this.userentry,
        this.tglentry,
        this.status,
    });

    Detailjawaban copyWith({
        int? idpermitdtl,
        int? idpermit,
        int? idpertanyaan,
        int? jawaban,
        String? jam,
        int? jml,
        String? catatan,
        int? userentry,
        DateTime? tglentry,
        String? status,
    }) => 
        Detailjawaban(
            idpermitdtl: idpermitdtl ?? this.idpermitdtl,
            idpermit: idpermit ?? this.idpermit,
            idpertanyaan: idpertanyaan ?? this.idpertanyaan,
            jawaban: jawaban ?? this.jawaban,
            jam: jam ?? this.jam,
            jml: jml ?? this.jml,
            catatan: catatan ?? this.catatan,
            userentry: userentry ?? this.userentry,
            tglentry: tglentry ?? this.tglentry,
            status: status ?? this.status,
        );

    factory Detailjawaban.fromJson(Map<String, dynamic> json) => Detailjawaban(
        idpermitdtl: json["idpermitdtl"],
        idpermit: json["idpermit"],
        idpertanyaan: json["idpertanyaan"],
        jawaban: json["jawaban"],
        jam: json["jam"],
        jml: json["jml"],
        catatan: json["catatan"],
        userentry: json["userentry"],
        tglentry: json["tglentry"] == null ? null : DateTime.parse(json["tglentry"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "idpermitdtl": idpermitdtl,
        "idpermit": idpermit,
        "idpertanyaan": idpertanyaan,
        "jawaban": jawaban,
        "jam": jam,
        "jml": jml,
        "catatan": catatan,
        "userentry": userentry,
        "tglentry": tglentry?.toIso8601String(),
        "status": status,
    };
}
