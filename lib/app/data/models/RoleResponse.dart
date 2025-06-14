// To parse this JSON data, do
//
//     final roleResponse = roleResponseFromJson(jsonString);

import 'dart:convert';

RoleResponse roleResponseFromJson(String str) =>
    RoleResponse.fromJson(json.decode(str));

String roleResponseToJson(RoleResponse data) => json.encode(data.toJson());

class RoleResponse {
  bool? success;
  String? message;
  List<Role>? data;

  RoleResponse({
    this.success,
    this.message,
    this.data,
  });

  RoleResponse copyWith({
    bool? success,
    String? message,
    List<Role>? data,
  }) =>
      RoleResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory RoleResponse.fromJson(Map<String, dynamic> json) => RoleResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Role>.from(json["data"]!.map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Role {
  int? idrole;
  String? namarole;
  int? status;

  Role({
    this.idrole,
    this.namarole,
    this.status,
  });

  Role copyWith({
    int? idrole,
    String? namarole,
    int? status,
  }) =>
      Role(
        idrole: idrole ?? this.idrole,
        namarole: namarole ?? this.namarole,
        status: status ?? this.status,
      );

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        idrole: json["idrole"],
        namarole: json["namarole"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "idrole": idrole,
        "namarole": namarole,
        "status": status,
      };
}
