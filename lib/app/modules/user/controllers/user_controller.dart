import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hsse2/app/data/models/ListUser.dart';
import 'package:hsse2/app/data/providers/user_provider.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';

class UserController extends GetxController with StateMixin<List<UserItem>> {
  var userProvider = Get.put(UserProvider());

  @override
  void onInit() {
    super.onInit();
    getListUserFetch();
  }

  var searchText = ''.obs;
  var selectedUsers = <int>{}.obs;

  void toggleSelection(int index) {
    if (selectedUsers.contains(index)) {
      selectedUsers.remove(index);
    } else {
      selectedUsers.add(index);
    }
    update();
  }

  void getListUserFetch() {
    try {
      userProvider
          .getListUser(searchText.value)
          .then((value) {
            change(value.data, status: RxStatus.success());
          })
          .onError((error, _) {
            change(null, status: RxStatus.error());
          });
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  void deleteUser() {
    var userlist = selectedUsers.toList();
    if(userlist.isEmpty) {
      Get.back();
      DialogAlert.notif("Belum memilih user", "error");
      return;
    }
    var temp = jsonEncode(userlist);
    try {
      userProvider
          .deleteUser(
            temp
          )
          .then((value) {
            Get.back();
            DialogAlert.notif(value.toString(), "success");
            getListUserFetch();
          })
          .onError((error, _) {
            DialogAlert.notif(error.toString(), "error");
          });
    } catch (e) {
      DialogAlert.notif("Network Error", "error");
    }
  }
}
