// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    bool? success;
    String? message;
    Data? data;

    LoginResponse({
        this.success,
        this.message,
        this.data,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
    int? iduser;
    String? username;
    String? nama;
    String? email;
    String? perusahaan;
    int? idrole;
    String? role;
    String? token;

    Data({
        this.iduser,
        this.username,
        this.nama,
        this.email,
        this.perusahaan,
        this.idrole,
        this.role,
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        iduser: json["iduser"],
        username: json["username"],
        nama: json["nama"],
        email: json["email"],
        perusahaan: json["perusahaan"],
        idrole: json["idrole"],
        role: json["role"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "username": username,
        "nama": nama,
        "email": email,
        "perusahaan": perusahaan,
        "idrole": idrole,
        "role": role,
        "token": token,
    };
}
