import 'package:hsse2/app/data/providers/base_provider.dart';

import '../models/ProfileResponse.dart';
import '../models/RoleResponse.dart';

class UserProvider extends BaseProvider {
  Future<String> ubahPassword(
    passwordlama,
    passwordbaru,
    konfirmasipasswordbaru,
  ) async {
    var response = await post('user/ubahpassword', {
      'passwordlama': passwordlama,
      'passwordbaru': passwordbaru,
      'konfirmasipasswordbaru': konfirmasipasswordbaru,
    });

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body["message"];
    }
  }

  Future<RoleResponse> getRole() async {
    var response = await get('role');

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return roleResponseFromJson(response.bodyString.toString());
    }
  }

  Future<ProfileResponse> getProfile() async {
    var response = await get('profile');

    print(response.body);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return profileResponseFromJson(response.bodyString.toString());
    }
  }

  Future<String> updateProfile(
    String username,
    String nama,
    String email,
    String telp,
    String perusahaan,
    int idrole,
  ) async {
    var formData = {
      // 'username': username,
      'nama': nama,
      'email': email,
      'telp': telp,
      'perusahaan': perusahaan,
      'idrole': idrole,
    };
    var response = await post('user/updateuser', formData);

    if (!response.body['success']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body['message'];
    }
  }
}
