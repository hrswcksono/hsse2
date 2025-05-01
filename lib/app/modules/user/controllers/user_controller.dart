import 'package:get/get.dart';

class UserController extends GetxController {
  //TODO: Implement UserController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  var searchText = ''.obs;
  var selectedUsers = <int>{}.obs;

  List<Map<String, String>> userList = List.generate(51, (index) {
    return {
      'username': 'username',
      'email': 'email',
      'telepon': 'telepon',
      'jabatan': 'jabatan',
    };
  });

  void toggleSelection(int index) {
    if (selectedUsers.contains(index)) {
      selectedUsers.remove(index);
    } else {
      selectedUsers.add(index);
    }
  }
}
