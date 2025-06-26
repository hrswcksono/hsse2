import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00A88F), // sama seperti halaman login
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/forgot_password.png', // ganti dengan ilustrasi kunci/lupa password
                  height: 200,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Lupa Password?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Masukkan email yang terdaftar untuk mendapatkan link reset password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                const SizedBox(height: 24),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Handle forgot password logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Kirim Link Reset"),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text(
                    "Kembali ke Login",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
