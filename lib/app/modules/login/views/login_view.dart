import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hsse2/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // tambahkan scroll
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset('assets/images/login_image.png', height: 200),
                const SizedBox(height: 20),
                const Text(
                  'Silahkan login akun anda untuk melanjutkan',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 20),
                // Username
                TextField(
                  controller: controller.usernameTF,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    hintText: 'username',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Password
                TextField(
                  controller: controller.passwordTF,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(Icons.visibility),
                    hintText: 'password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: controller.submitLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do you have any account? "),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.REGISTER),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue[900],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
