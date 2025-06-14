import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hsse2/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Image.asset(
                'assets/images/login_image.png', // Replace with your asset path
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Silahkan login akun anda untuk melanjutkan',
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 20),
              // Username field
              TextField(
                controller: controller.usernameTF,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: 'username',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Password field
              TextField(
                controller: controller.passwordTF,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.visibility),
                  hintText: 'password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 25),
              // Login button
              ElevatedButton(
                onPressed: () {
                  controller.submitLogin();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 15),
              // Register and Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do you have any account? "),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.REGISTER);
                    },
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
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black87,
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
