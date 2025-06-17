// To parse this JSON data, do
//
//     final listUser = listUserFromJson(jsonString);

import 'dart:convert';

ListUser listUserFromJson(String str) {
    final jsonData = json.decode(str);
    return ListUser.fromJson(jsonData);
}

String listUserToJson(ListUser data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class ListUser {
    bool success;
    String message;
    List<UserItem> data;

    ListUser({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ListUser.fromJson(Map<String, dynamic> json) => new ListUser(
        success: json["success"],
        message: json["message"],
        data: new List<UserItem>.from(json["data"].map((x) => UserItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class UserItem {
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

    UserItem({
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

    factory UserItem.fromJson(Map<String, dynamic> json) => new UserItem(
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
