import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hsse2/app/routes/app_pages.dart';

import '../../../../utils/values/colors.dart';
import '../../../widgets/global_app_bar.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: "Ubah Profil",
        pBgColor: CustomColor.appBarColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              SizedBox(height: 30),

              buildField(Icons.person_outline, "username", controller.usernameTF),
              buildField(Icons.person, "nama", controller.namaTF),
              buildField(Icons.email_outlined, "email", controller.emailTF),
              buildField(Icons.phone, "telepon", controller.telpTF),
              buildField(Icons.groups, "jabatan", controller.roleTF, readOnly: true),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: controller.saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Simpan"),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.UBAH_PASSWORD);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Ubah Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(IconData icon, String hint, TextEditingController ctrl, {bool readOnly = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextField(
      controller: ctrl,
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}

}
