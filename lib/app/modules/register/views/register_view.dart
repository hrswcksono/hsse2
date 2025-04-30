import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00A89D),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Register",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Silahkan isi form untuk membuat akun anda"),
              SizedBox(height: 30),

              buildTextField(
                Icons.person_outline,
                "username",
                controller.username,
              ),
              buildTextField(Icons.person, "nama", controller.name),
              buildTextField(Icons.email_outlined, "email", controller.email),
              buildTextField(Icons.phone, "telepon", controller.phone),

              Obx(
                () => DropdownButtonFormField<String>(
                  value:
                      controller.selectedJob.value.isEmpty
                          ? null
                          : controller.selectedJob.value,
                  items:
                      controller.jobs.map((job) {
                        return DropdownMenuItem(value: job, child: Text(job));
                      }).toList(),
                  onChanged: (value) {
                    controller.selectedJob.value = value!;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.groups),
                    hintText: "jabatan",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              buildPasswordField("password", controller.password),
              buildPasswordField(
                "confirm password",
                controller.confirmPassword,
              ),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  print("Username: ${controller.username.text}");
                  print("Jabatan: ${controller.selectedJob.value}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Register'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    IconData icon,
    String hint,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
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

  Widget buildPasswordField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: Icon(Icons.visibility),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
