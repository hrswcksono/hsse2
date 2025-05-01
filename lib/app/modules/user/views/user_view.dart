import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00A89D),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Manage Akun",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Icon(Icons.notifications_none),
                ],
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                onChanged: (val) => controller.searchText.value = val,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      icon: Icon(Icons.person_add),
                      label: Text("Tambah Akun"),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      icon: Icon(Icons.person_remove),
                      label: Text("Hapus Akun"),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Obx(() {
                  final filteredUsers =
                      controller.userList
                          .asMap()
                          .entries
                          .where(
                            (entry) => entry.value['username']!.contains(
                              controller.searchText.value,
                            ),
                          )
                          .toList();

                  return ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, i) {
                      int index = filteredUsers[i].key;
                      var user = filteredUsers[i].value;
                      return Row(
                        children: [
                          Checkbox(
                            value: controller.selectedUsers.contains(index),
                            onChanged: (_) => controller.toggleSelection(index),
                          ),
                          Icon(Icons.person),
                          SizedBox(width: 8),
                          Expanded(child: Text(user['username']!)),
                          Expanded(child: Text(user['email']!)),
                          Expanded(child: Text(user['telepon']!)),
                          Expanded(child: Text(user['jabatan']!)),
                        ],
                      );
                    },
                  );
                }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "page 1 - ...",
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
