// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  bool? success;
  String? message;
  Data? data;

  ProfileResponse({
    this.success,
    this.message,
    this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
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
  int? idrole;
  String? email;
  String? telp;
  String? perusahaan;
  String? password;
  int? status;
  String? namarole;

  Data({
    this.iduser,
    this.username,
    this.nama,
    this.idrole,
    this.email,
    this.telp,
    this.perusahaan,
    this.password,
    this.status,
    this.namarole,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        iduser: json["iduser"],
        username: json["username"],
        nama: json["nama"],
        idrole: json["idrole"],
        email: json["email"],
        telp: json["telp"],
        perusahaan: json["perusahaan"],
        password: json["password"],
        status: json["status"],
        namarole: json["namarole"],
      );

  Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "username": username,
        "nama": nama,
        "idrole": idrole,
        "email": email,
        "telp": telp,
        "perusahaan": perusahaan,
        "password": password,
        "status": status,
        "namarole": namarole,
      };
}
