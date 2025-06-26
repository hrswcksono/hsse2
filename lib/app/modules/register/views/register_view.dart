import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hsse2/app/data/models/RoleResponse.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});

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
                "Username",
                controller.usernameTF,
              ),
              buildTextField(Icons.person, "Nama", controller.namaTF),
              buildTextField(Icons.email_outlined, "Email", controller.emailTF),
              buildTextField(Icons.phone, "Telepon", controller.telpTF),
              SizedBox(height: 7),

              GetBuilder<RegisterController>(
                builder: (controller) {
                  return DropdownSearch<Role>(
                    items: controller.listRole,
                    selectedItem: controller.selectedJob,
                    itemAsString: (Role? role) => role?.namarole ?? "",
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        hintText: "Jabatan",
                        prefixIcon: Icon(Icons.groups),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      controller.selectedJob = value;
                      controller.idRole = value!.idrole!;
                      controller.update();
                    },
                  );
                },
              ),
              SizedBox(height: 7),

              buildPasswordField("Password", controller.passwordTF),
              buildPasswordField(
                "Confirm Password",
                controller.passwordConfirmTF,
              ),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  controller.submitRegister();
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
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account? "),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                ],
              ),
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
