import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/RoleResponse.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/utils/values/colors.dart';
import '../controllers/user_form_controller.dart';

class UserFormView extends GetView<UserFormController> {
  const UserFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
        pTitle: "Tambah Akun Pengguna",
        pBgColor: CustomColor.appBarColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Silakan isi data pengguna dengan lengkap.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),

              buildLabeledField(
                "Username",
                Icons.person_outline,
                controller.usernameTF,
              ),
              buildLabeledField("Nama", Icons.person, controller.namaTF),
              buildLabeledField(
                "Email",
                Icons.email_outlined,
                controller.emailTF,
              ),
              buildLabeledField("Telepon", Icons.phone, controller.telpTF),

              const SizedBox(height: 2),
              const Text(
                "Jabatan",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 2),
              SizedBox(
                height: 30,
                child: DropdownSearch<Role>(
                  items: controller.listRole,
                  selectedItem: controller.selectedJob,
                  itemAsString: (Role? role) => role?.namarole ?? "",
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      isDense: true,
                      hintText: "Pilih Jabatan",
                      hintStyle: const TextStyle(fontSize: 12),
                      prefixIcon: const Icon(Icons.groups, size: 16),
                      prefixIconConstraints: const BoxConstraints(minWidth: 30),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  popupProps: const PopupProps.menu(showSearchBox: false),
                  dropdownBuilder:
                      (context, selectedItem) => Text(
                        selectedItem?.namarole ?? "",
                        style: const TextStyle(fontSize: 12),
                      ),
                  onChanged: (value) {
                    controller.selectedJob = value;
                    controller.idRole = value?.idrole ?? 0;
                    controller.update();
                  },
                ),
              ),

              const SizedBox(height: 4),
              buildLabeledPassword("Password", controller.passwordTF),
              buildLabeledPassword(
                "Konfirmasi Password",
                controller.passwordConfirmTF,
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.submitRegister(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Simpan Akun'),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customPopupItemBuilder(
    BuildContext context,
    Role? item,
    bool isSelected,
  ) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      title: Text(item?.namarole ?? '', style: const TextStyle(fontSize: 12)),
    );
  }

  Widget buildLabeledField(
    String label,
    IconData icon,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: 36,
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 10,
                ),
                prefixIcon: Icon(icon, size: 16),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 30,
                  minHeight: 30,
                ),
                hintText: label,
                hintStyle: const TextStyle(fontSize: 12),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLabeledPassword(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: 36,
            child: TextField(
              controller: controller,
              obscureText: true,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 10,
                ),
                prefixIcon: const Icon(Icons.lock_outline, size: 16),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 30,
                  minHeight: 30,
                ),
                suffixIcon: const Icon(Icons.visibility, size: 16),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 30,
                  minHeight: 30,
                ),
                hintText: label,
                hintStyle: const TextStyle(fontSize: 12),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
