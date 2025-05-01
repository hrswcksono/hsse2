import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hsse2/utils/values/colors.dart';

import '../../../widgets/global_app_bar.dart';
import '../controllers/ubah_password_controller.dart';

class UbahPasswordView extends GetView<UbahPasswordController> {
  const UbahPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: "Ubah Profil",
        pBgColor: CustomColor.appBarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 40),

              buildPasswordField(
                Icons.lock,
                "password lama",
                controller.oldPassword,
              ),
              buildPasswordField(
                Icons.lock_outline,
                "password baru",
                controller.newPassword,
              ),
              buildPasswordField(
                Icons.vpn_key,
                "konfirmasi password",
                controller.confirmPassword,
              ),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: controller.saveNewPassword,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField(
    IconData icon,
    String hint,
    TextEditingController ctrl,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: ctrl,
        obscureText: true,
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
